require 'food_apis_module'

class FoodItemController < ApplicationController
  include FoodApisModule

  ##
  # @todo this controller will be removed because its just for testing propose
  def index
    @food_item = FoodItem.get_all_items
  end

  def show
    @food_item  = FoodItem.get_local_item params[:api_key].to_i, params[:food_id]
  end

  def search
    @food_items = FoodItem.search_query params[:query]
  end
end
