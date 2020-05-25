class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :username, :profile_pic, :about ) }
     devise_parameter_sanitizer.permit(:account_update) { |u|    u.permit(:email, :password, :current_password, :username, :profile_pic, :about) }
   end

private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
  root_path
  end
end