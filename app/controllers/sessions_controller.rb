class SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    if params[:role] == 'admin'
      render 'admin_login'
    else
      render 'client_login'
    end
  end

  def create
    super do |resource|
      if params[:role] == 'admin'
        return redirect_to root_path if resource.admin?
      else
        return redirect_to root_path if resource.client?
      end
    end
  end
end
