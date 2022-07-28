class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  protected

  # Permit sign-in to insert fname, lname, and user_id into Users table
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :user_type, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fname, :lname, :user_type, :email, :password)}
  end

end
