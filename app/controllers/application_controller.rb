class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
      :avatar,
      :email,
      :password,
      :first_name,
      :last_name
    ) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(
      :avatar,
      :current_password, 
      :password,
      :password_confirmation,
      :first_name,
      :last_name
    ) }
  end
end
