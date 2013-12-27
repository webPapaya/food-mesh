require 'food_apis_module'

class LineChartsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  before_filter :create_instance
  def index
    @line_chart = @instance.build_paths search_apis('cookies')
  end

  private
  def create_instance
    @instance = LineChart.new
  end
end
