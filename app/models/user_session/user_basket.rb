module UserBasket
  include FoodApisModule
  def delete_all_items
    @session[:item_basket] = []
  end

  ##
  # checks if element is already in the user list
  # if not it adds the item to the item_basket
  def add_item_to_basket(item_id)
    @session[:item_basket] << item_id unless (@session[:item_basket].include? item_id)
  end

  def delete_item_from_basket(basket_idx)
    @session[:item_basket].delete_at(basket_idx.to_i)
  end

  def get_user_items
    basket = FoodItem.get_local_items @session[:item_basket]
    return basket unless basket.empty?
    'empty item basket'
  end
end