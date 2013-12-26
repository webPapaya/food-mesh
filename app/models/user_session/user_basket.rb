module UserBasket
  def delete_all_items
    @session[:item_basket] = []
  end

  def add_item_to_basket(item)
    @session[:item_basket] << item
  end

  def get_user_items
    basket = []
    @session[:item_basket].each do |item|
      basket << FoodItem.get_local_item(item[:api_id].to_i, item[:item_id])
    end

    return basket unless basket.empty?
    'empty item basket'
  end
end