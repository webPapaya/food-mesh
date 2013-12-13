require 'food_apis_module'

class FoodOverviewsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    @results = search_apis params[:query]
  end

  def show
    api = params[:api]
    food_id = params[:food_id]

    @results = get_item food_id
  end
end
