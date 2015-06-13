class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      flash[:success] = 'Thank you for signing in!'
      sign_in(user)
      redirect_to user_path(user[:id])
    else
      flash.now[:error] = 'Invalid name'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
