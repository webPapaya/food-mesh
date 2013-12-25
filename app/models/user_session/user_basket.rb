module UserBasket
  def delete_all_items
    @session[:item_basket] = []
  end

  def add_item_to_basket(item)
    @session[:item_basket] << item
  end

  def get_user_items
    return @session[:item_basket] unless @session[:item_basket].empty?
    'empty item basket'
  end
end