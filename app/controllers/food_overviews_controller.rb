require 'food_apis_module'

class FoodOverviewsController < ApplicationController
  respond_to :js

  include FoodApisModule #include all functions from foodAPIs Module

  def index
    @results = search_apis params[:query]
  end

  def show
    api_id = params[:api_id].to_i
    food_id = params[:food_id]
    @results = get_item(api_id, food_id)

    pie_chart_instance = PieChart.new @results[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
    ap @pie_chart

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

    respond_to do |format|
      format.js { redirect_to :back }
    end
  end
end
