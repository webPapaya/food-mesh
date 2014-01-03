class UsersController < ApplicationController
  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
