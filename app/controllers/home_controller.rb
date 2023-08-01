class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        render 'admin/home/index'
      else
        render 'client/home/index'
      end
    else
      render 'common_index'
    end
  end
end
