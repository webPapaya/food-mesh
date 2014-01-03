class SessionsController < ApplicationController

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to dashboard_path, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  #
  #redirects administrator to intern admin page
  # when side is reloaded
  def new
    if logged_in?
      redirect_to dashboard_path, :notice => "Logged in!"
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
