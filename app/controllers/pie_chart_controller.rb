class PieChartController < ApplicationController
  def index
    PieChart.create_dummy_chart

    @center = PieChart.center
    @values = PieChart.values
    @coords = PieChart.get_coords
    @inner_angle = PieChart.inner_angle
    @segments = PieChart.segments
    @circle = PieChart.circumference

  end
end
