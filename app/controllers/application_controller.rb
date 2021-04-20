class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
    def after_sign_in_path_for(resource)
        user_path(current_user)# your path
    end
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :bio])
    end
end
