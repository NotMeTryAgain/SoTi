class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      flash[:notice] = "User is no more!"
      redirect_to admin_users_path
    end
  end
end
