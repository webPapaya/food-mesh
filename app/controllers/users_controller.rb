class UsersController < ApplicationController

  def index
    if logged_in?
      @users = User.all
    else
      redirect_to :back, :notice => "Not permitted"
    end
  end

  def new
    if logged_in?
      @user = User.new(user_params)
    else
      redirect_to root_url, :notice => "Not permitted to create new user"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :back, :notice => "Signed up!"
    else
      render :new
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
