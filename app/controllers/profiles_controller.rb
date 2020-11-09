class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    def index 
        @profiles = Profile.all
    end

    def show
    end

    def new
        @profile = Profile.new
    end

    def edit
    end

    def create
        @profile = Profile.new(item_params)
    
        respond_to do |format|
          if @profile.save
            format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
          else
            format.html { render :new }
          end
        end
    end

    def update
        respond_to do |format|
          if @profile.update(profile_params)
            format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end
    
      def destroy
        @profile.destroy
        respond_to do |format|
          format.html { redirect_to items_url, notice: 'Profile was successfully destroyed.' }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_profile
        @item = Profile.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def profile_params
        params.require(:username).permit(:username, :first_name, :surname)
      end

end
