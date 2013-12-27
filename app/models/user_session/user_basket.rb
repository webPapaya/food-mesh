module UserBasket
  include FoodApisModule
  def delete_all_items
    @session[:item_basket] = []
  end

  def add_item_to_basket(item)
    @session[:item_basket] << item
  end

  def get_user_items
    basket = []
    @session[:item_basket].each do |item|
      basket << item[:item_id]
    end

    return basket unless basket.empty?
    'empty item basket'
  end
end