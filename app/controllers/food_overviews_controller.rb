require 'food_apis_module'
require 'to_lang'
ToLang.start('AIzaSyBziOZmDxbJtVi5jwODMoJrMtYckyw_WKg')


class FoodOverviewsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    @results = search_apis params[:query]
    @results.each do |result|
      names = result[:name].to_german
      ap names
    end
  end

  def show
    api_id = params[:api_id].to_i
    food_id = params[:food_id]
    @results = get_item(api_id, food_id)
    ap names = params[:name]

    pie_chart_instance = PieChart.new @results[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
  end

  def redirect_to_index
    redirect_to :controller => 'food_overviews', :action => 'index', :query => params[:query]
  end
end
