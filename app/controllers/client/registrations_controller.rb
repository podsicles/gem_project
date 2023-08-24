class Client::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    cookies[:promoter_email] ||= params[:promoter]
    super
  end

  def create
    super do |user|
      promoter_email = cookies[:promoter_email]
      if promoter_email && (promoter = User.find_by(email: promoter_email))
        user.update(parent_id: promoter.id)
      end
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up)
  end
end