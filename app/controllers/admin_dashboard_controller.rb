class AdminDashboardController < ApplicationController
  before_filter :require_login

  def index
    @users = User.all
  end
end
