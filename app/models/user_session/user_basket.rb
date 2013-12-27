module UserBasket
  include FoodApisModule
  def delete_all_items
    @session[:item_basket] = []
  end

  def add_item_to_basket(item_id)
    @session[:item_basket] << item_id
  end

  def get_user_items
    basket = FoodItem.get_local_items @session[:item_basket]
    return basket unless basket.empty?
    'empty item basket'
  end
end