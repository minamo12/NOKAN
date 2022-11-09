class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
    end

    if resource_class == Admin
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
    end
  end

end
