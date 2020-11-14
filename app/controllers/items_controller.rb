class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authorise_check, only: [:edit, :destroy]

  def index
    @items = Item.all
  end


  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @item.title,
          description: @item.description,
          # images: @item.item_picture, NEED TO FIX THIS...
          amount: (@item.price * 100).to_i,
          currency: 'aud',
          quantity: 1
      }],
      payment_intent_data: {
          metadata: {
              item_id: @item.id,
              user_id: current_user.profile.username
          }
      },
      success_url: "#{root_url}payments/success?itemId=#{@item.id}",
      cancel_url: "#{root_url}items"
      )
    @session_id = session.id
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.profile_id = current_user.profile.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
        @item.destroy
        respond_to do |format|
          format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
          format.json { head :no_content }
        end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :price, :description, :item_picture, :sold)
    end
    def authorise_check
      if current_user.profile.id != @item.profile_id
        flash[:notice] = 'You can only do this to your own items...'
        redirect_to items_path
      end
    end
end
