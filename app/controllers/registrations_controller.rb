class RegistrationsController < Devise::RegistrationsController
    protected
  # USED FOR REDIRECT AFTER CREATING DEVISE USER TO THEN CREATE PROFILE FOR USER
    def after_sign_up_path_for(resource)
        # flash[:notice] = 'You must create a Profile'
        '/profiles/new'
    end
  end