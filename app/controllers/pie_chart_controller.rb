require 'food_data'

class PieChartController < ApplicationController
  def index
    instance = PieChart.new
    foodDB =   FoodData.new

    @center = instance.center
    @values = instance.values
    @coords = instance.get_coords
    @inner_angle = instance.inner_angle
    @segments = instance.segments
    @circle = instance.get_daily_calories_in_procent 1200
    @chart_mask = instance.pie_chart_mask
    @colors = instance.colors
    @width_height = instance.width_height

    @debug = instance.get_food "fish"
  end
end
