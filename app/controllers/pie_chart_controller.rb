require 'food_data'
require 'food_apis_module'

class PieChartController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module


  def index
    instance = PieChart.new  #create new pieChart



    @center = instance.center
    @values = instance.values
    @coords = instance.get_coords
    @inner_angle = instance.inner_angle
    @segments = instance.segments
    @circle = instance.get_daily_calories_in_procent 1200
    @chart_mask = instance.pie_chart_mask
    @colors = instance.colors
    @width_height = instance.width_height

    @debug = search_apis params[:query]
  end
end
