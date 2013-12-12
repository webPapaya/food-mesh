require_dependency 'food_apis_module'

class PieChart < ActiveRecord::Base
  attr_reader :values, :width_height, :segments, :inner_angle, :pie_chart_mask, :colors


  def initialize (width_height=500, segments=6)
    @pie_chart = {}
    @random = Random.new
    @values = create_dummy_chart
    @width_height = width_height
    @segments = segments
    @inner_angle  = 360 / @segments
    @radiant = deg_to_rad(@inner_angle)
    @pie_chart_mask = create_outer_mask
    @colors = %w[#2BA772 #1C7F60 #19436B #F7B475 #50B694 #66A4D1 #205779 #3997CF #2BA772']
  end

  def get_pie_chart
    {
        :values => create_dummy_chart,
        :coords => get_coords,
        :inner_angle => inner_angle,
        :segments => @values.length, #should be removed and in view use segments.length
        :daily_kcal => get_daily_calories_in_procent(1000),
        :chart_mask => pie_chart_mask,
        :colors =>  %w[#2BA772 #1C7F60 #19436B #F7B475 #50B694 #66A4D1 #205779 #3997CF #2BA772'],
        :width_height => @width_height,
        :center => @width_height/2
    }
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

  def get_daily_calories_in_procent calories
    procent = calculate_daily_calories 2000, calories
    circumference procent
  end

  def circumference procent
    procent = procent.to_f

    circle = Hash.new
    circumference = calculate_circumference

    circle["line"] = circumference*(procent/100)
    circle["space"] = circumference*((100-procent)/100)

    circle
  end

  private
  def deg_to_rad (deg)
    Math::PI/180 * deg
  end

  def calculate_circumference
    Math::PI*(@width_height)
  end

  def calculate_daily_calories base, calories
    calories.to_f/base*100
  end
end


