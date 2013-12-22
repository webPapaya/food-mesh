class UserSession < ActiveRecord::Base
  def initialize (session)
    @session = session
    @session[:item_basket] ||= [] # init session item_basket
    @session[:user_settings] ||= {
        :weight => 80,
        :height => 180,
        :age => 21
    }
  end

  def add_item_to_basket(item)
    @session[:item_basket] << item
  end

  def get_user_settings
    @session[:user_settings]
  end

  def change_user_settings(params)
    @session[:user_settings] = {
        :weight => params[:user_settings][:user_settings_weight],
        :height => params[:user_settings][:user_settings_height],
        :age => params[:user_settings][:user_settings_age]
    }
  end
end