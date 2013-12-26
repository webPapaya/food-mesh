require 'food_apis_module'

class FoodItemController < ApplicationController
  include FoodApisModule

  def index
    @food_item = FoodItem.get_all_items
  end

  def show
    item = FoodItem.get_local_item params[:api_key].to_i, params[:food_id]
    @food_item = item
  end
end
