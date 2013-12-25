class FoodItemController < ApplicationController
  def index
    @food_item = FoodItem.new_item
  end
end
