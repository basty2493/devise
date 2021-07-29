class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #protect_from_forgery with: :exception


  protected

  def authenticate_admin!
    unless current_user.present? && current_user.admin?
      redirect_to root_path, notice => "You must be an admin to access this page"
    end 
  end    

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end  

 end
