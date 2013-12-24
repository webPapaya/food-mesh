require 'food_apis_module'

class FoodOverviewsController < ApplicationController
  respond_to :js

  include FoodApisModule #include all functions from foodAPIs Module

  def index
    @results = search_apis params[:query]
    get_linechart
  end

  def show
    api_id = params[:api_id].to_i
    food_id = params[:food_id]
    @results = get_item(api_id, food_id)

    pie_chart_instance = PieChart.new @results[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
    ap @pie_chart

    line_chart_instance = LineChart.new @results[:nutritions]
    @line_chart = line_chart_instance.get_pie_chart
    ap @line_chart

  end

  def get_linechart

    logger.debug("_____a_____")
    logger.debug(@results)
    logger.debug("____b______")
    @results.each do |h|
      logger.debug(h[:name])
      logger.debug(h[:nutritions])
    end


    #line_chart_instance = LineChart.new @results[:nutritions]
    #@line_chart = line_chart_instance.get_pie_chart
    #ap @line_chart
  end

  def redirect_to_index
    redirect_to :controller => 'food_overviews', :action => 'index', :query => params[:query]
  end
end
