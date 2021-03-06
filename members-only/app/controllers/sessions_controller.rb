class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) != false
      flash[:success] = 'Thank you for signing in!'
      sign_in(user)
      redirect_to posts_path 
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
