class UserSession
  def initialize (session)
    @session = session
    @session[:item_basket] ||= [] # init session item_basket
  end

  def add_item_to_basket(item)
    @session[:item_basket] << item

    puts @session[:item_basket]

  end
end