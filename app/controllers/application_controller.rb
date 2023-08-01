class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource) if is_navigational_format?
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_root_path
    else
      client_root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
