class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role, :phone_number, :address, :email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :remember_me])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :role, :phone_number, :address, :email, :password, :remember_me])
    end
end
