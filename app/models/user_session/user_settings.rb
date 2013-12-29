module UserSettings
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