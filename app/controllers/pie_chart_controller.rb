class PieChartController < ApplicationController
  def index
    instance = PieChart.new

    @center = instance.center
    @values = instance.values
    @coords = instance.get_coords
    @inner_angle = instance.inner_angle
    @segments = instance.segments
    @circle = instance.circumference
    @chart_mask = instance.create_outer_mask

  end
end
