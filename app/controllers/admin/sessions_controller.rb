class Admin::SessionsController < Devise::SessionsController
  layout 'admin'

  def create
    user = User.find_by(email: params[:admin_user][:email])
    if user&.admin?
      super
    else
      flash[:alert] = "Wrong email or password"
      redirect_to action: :new
    end
  end
end
