class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    flash.notice = "User with name '#{@user.name}' created!"
    sign_in(@user)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end
end
