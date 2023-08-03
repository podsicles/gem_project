class Client::SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.client?
      super
    else
      flash[:alert] = "Invalid email or password"
      redirect_to action: :new
    end
  end
end
