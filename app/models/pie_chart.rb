class PieChart < ActiveRecord::Base
  attr_reader :values, :width_height, :segments, :inner_angle, :pie_chart_mask, :colors


  def initialize (width_height=300, segments=10)
    @random = Random.new
    @values = create_dummy_chart
    @width_height = width_height
    @segments = segments
    @inner_angle  = 360 / @segments
    @radiant = deg_to_rad(@inner_angle)
    @pie_chart_mask = create_outer_mask

    @colors = %w[#2BA772 #1C7F60 #19436B #F7B475 #50B694 #66A4D1 #205779 #3997CF #2BA772']
  end

  def create_dummy_chart
    values = Array.new
    (0..5).each do |i|
      values[i] = Random.rand(100)
    end
    values
  end

  def get_coords
    coords = Hash.new

    coords['x1'] = Math.cos(@radiant).abs * (@width_height) + @width_height/2
    coords['y1'] = Math.sin(@radiant).abs * (@width_height) + @width_height/2

    coords['x2'] = @width_height
    coords['y2'] = @width_height / 2

    coords
  end


  def center
    @width_height/2
  end

  def create_outer_mask
    mask = Hash.new

    mask['inner'] = @width_height.to_f/10
    mask['outer'] = @width_height.to_f

    mask
  end

  def circumference
    procent = 40.0
    circle = Hash.new
    circumference = calculate_circumference

    circle["line"] = circumference*(procent/100) - 5
    circle["space"] = circumference*((100-procent)/100) - 5

    circle
  end

  private
    def deg_to_rad (deg)
      Math::PI/180 * deg
    end

    def calculate_circumference
      2*Math::PI*(@width_height)
    end
end
