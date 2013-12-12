class LineChartsController < ApplicationController
  #require 'food_apis_module'

  class LineChartController < ApplicationController
    #include FoodApisModule

    def index
      instance = LineChart.new  #create new pieChart
      @line_chart = instance.get_line_chart
    end
  end

end
