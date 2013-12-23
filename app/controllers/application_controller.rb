require 'awesome_print'
class ApplicationController < ActionController::Base
  before_filter :user_session
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def user_session
    @user_session ||= UserSession.new(session)
  end


  helper_method :user_session
end
