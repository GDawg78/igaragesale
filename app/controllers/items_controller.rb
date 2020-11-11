class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authorise_check, only: [:edit, :destroy]

  def index
    @items = Item.all
  end


  def show
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
      params.require(:item).permit(:title, :price, :description, :item_picture)
    end
    def authorise_check
      if current_user.profile.id != @item.profile_id
        flash[:notice] = 'You can only do this to your own items...'
        redirect_to items_path
      end
    end
end
