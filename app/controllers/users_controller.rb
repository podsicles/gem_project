class UsersController < ApplicationController
  def edit
    @user = current_user
    @user.create_profile unless @user.profile
  end

  private

  def user_params
    params.require(:user).permit(:time_zone, profile_attributes: [:id, :legal_name, :birthday, :location, :education, :occupation, :bio, :specialty] )
  end
end