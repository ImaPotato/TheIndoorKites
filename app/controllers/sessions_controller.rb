class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'logged in'
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'logged out'
  end

  def redirect_to_homepage
    if is_logged_in
      redirect_to sign_up_path #but really we want this to go to the homepage
    end
  end
end
