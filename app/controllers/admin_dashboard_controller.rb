class AdminDashboardController < ApplicationController
  before_filter :require_login

  def index
    @users = User.all
    @latest_searches = Search.get_most_searched
  end
end
