class PieChartController < ApplicationController
  def index
    PieChart.create_dummy_chart


    @center = PieChart.center
    @values = PieChart.values
    @coords = PieChart.get_coords
    @radius = PieChart.radius
    @segments = PieChart.segments
  end
end
