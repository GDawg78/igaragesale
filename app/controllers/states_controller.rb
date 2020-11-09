class StatesController < ApplicationController
    before_action :set_state, only: [:show, :edit, :update, :destroy]

    def index 
        @states = State.all
    end

    def show
    end

    def new
        @state = State.new
    end

    def edit
    end

    def create      
      @state = State.new(state_params)
    
        respond_to do |format|
          if @state.save
            format.html { redirect_to @state, notice: 'State was successfully created.' }
          else
            format.html { render :new }
          end
        end
    end

    def update
        respond_to do |format|
          if @state.update(state_params)
            format.html { redirect_to @state, notice: 'State was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end

    def destroy
        @state.destroy
        respond_to do |format|
          format.html { redirect_to states_url, notice: 'State was successfully destroyed.' }
        end
      end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_params
      params.require(:state).permit(:state)
    end
    
end
