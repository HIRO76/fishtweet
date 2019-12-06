class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_signup_parameters, if: :devise_controller?
  before_action :configure_update_parameters, if: :devise_controller?

  def configure_signup_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
  end

  def configure_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end
  
end
