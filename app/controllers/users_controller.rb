class UsersController < ApplicationController
  def index
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nick_name, :profile, :gender, :birthday_1i, :birthday_2i, :birthday_3i, :email, :profile_image, :is_active).tap do |whitelisted|
      whitelisted[:profile_image] = nil if params[:user][:remove_profile_image] == '1'
    end
  end
end
