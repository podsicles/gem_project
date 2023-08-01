class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        render 'admin_index'
      else
        render 'client_index'
      end
    else
      render 'common_index'
    end
  end
end
