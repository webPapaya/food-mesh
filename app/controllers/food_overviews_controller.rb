require 'food_apis_module'

class FoodOverviewsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    @results = search_apis params[:query]
  end

  def show
    api_id = params[:api_id].to_i
    food_id = params[:food_id]
    @results = get_item(api_id, food_id)
  end

  def redirect_to_index
    redirect_to :controller => 'food_overviews', :action => 'index', :query => params[:query]
  end

  def add_item_to_basket
    item = {
        :item_id => params[:food_id],
        :api_id => params[:api_id]
    }

    user_session.add_item_to_basket item

    redirect_to :back
  end
end
