require 'food_apis_module'

class FoodItemController < ApplicationController
  include FoodApisModule

  def index
    @food_item = FoodItem.get_all_items
  end

  def show
    item = FoodItem.get_local_item 0, '513fceb675b8dbbc21001d69'
    @food_item = item
  end

  def drop_all
    FoodItem.drop_all
    redirect_to action: 'index'
  end
end
