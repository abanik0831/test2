#class UsersController < Devise::SessionsController
#  def create
#    Profile.new
#    ProfilePic.new
#  end
#  def update
#    #edit here
#  end
#end





class UsersController < ApplicationController
  def settings
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    #binding.pry
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      redirect_to :back , :notice => "setting not updated"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation, :current_password ,:email_for_new_like , :email_for_new_follower,:email_for_new_cmnt)
  end
end



