class UserSession
  #before_filter :change_user_settings
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

  def change_user_settings
    flash[:notice] = 'Task was successfully created.'
  end
end