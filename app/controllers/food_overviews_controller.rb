require 'food_apis_module'

class FoodOverviewsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    @results = search_apis params[:query]
  end

  def show
    @results = get_item '513fceb375b8dbbc210000e4'

    puts @results
  end
end
