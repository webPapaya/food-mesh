require 'awesome_print'
class ApplicationController < ActionController::Base
  before_filter :user_session
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def change_lang
    I18n.locale = params[:locale] || I18n.default_locale
    redirect_to search_db_path :locale => params[:locale], :query => params[:query]
  end

  private
  def user_session
    @user_session ||= UserSession.new(session)
  end


  before_filter :set_current_locale
  def set_current_locale
    I18n.locale = params[:locale]
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  helper_method :user_session, :default_url_options, :set_current_locale

  # authentication with sorcery
  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end

end
