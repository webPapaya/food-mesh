require 'food_apis_module'

class LineChartsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    instance = LineChart.new
    @line_chart = instance.get_line_chart
  end
  logger.debug("@line_chart"); logger.debug(@line_chart)
end
