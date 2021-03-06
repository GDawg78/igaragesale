class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorise_check, only: [:edit, :update, :destroy]
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
        @profile = Profile.new(profile_params)
        @profile.user_id = current_user.id
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
          format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_profile
        @profile = Profile.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def profile_params
        params.require(:profile).permit(:username, :first_name, :surname, :profile_picture, :flat_no, :street_no, :street_name, :post_code, :state_id)
      end
      def authorise_check
        if current_user.nil? || current_user.profile != @profile
          flash[:notice] = 'You can only make changes to your own profile...'
          redirect_to items_path
        end
      end
end
