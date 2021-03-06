class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
  end
  
  # ログイン後の先
  def after_sign_in_path_for(resource)
   case resource
   when Admin
    admin_areas_path
   when User
    about_path
   end
  end
  
end
