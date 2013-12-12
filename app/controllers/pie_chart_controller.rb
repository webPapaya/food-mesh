require 'food_apis_module'

class PieChartController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    instance = PieChart.new  #create new pieChart
    @pie_chart = instance.get_pie_chart
  end
end
