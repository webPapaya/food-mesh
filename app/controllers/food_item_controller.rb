require 'food_apis_module'

class FoodItemController < ApplicationController
  include FoodApisModule

  def index
    @food_item = FoodItem.get_all_items
  end

  def show
    item = get_item 0, '513fceb675b8dbbc21001d62'
    @food_item = FoodItem.new_item item
  end
end
