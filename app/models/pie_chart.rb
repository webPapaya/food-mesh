require_dependency 'food_apis_module'

class PieChart < ActiveRecord::Base
  def initialize (nutritions, width_height=500)
    @nutritions = nutritions
    @random = Random.new
    @width_height = width_height
    @inner_angle  = 360 /@nutritions.length
    @radiant = deg_to_rad(@inner_angle)

    @pie_chart_mask = create_outer_mask
  end

  def get_pie_chart
    #calories = nutritions['calories']
    #nutritions.delete('calories')
    #nutritions.delete('grams_of_sample')

    {
        :values => create_chart,
        :coords => get_coords,
        :inner_angle => @inner_angle,
        :segments => @nutritions.length, #should be removed and in view use segments.length
        :daily_kcal => get_daily_calories_in_procent(@nutritions['calories']),
        :chart_mask => create_outer_mask,
        :colors =>  %w[#2BA772 #1C7F60 #19436B #F7B475 #50B694 #66A4D1 #205779 #3997CF #2BA772'],
        :width_height => @width_height,
        :center => @width_height/2
    }
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

  def get_daily_calories_in_procent (calories)
    percent = calculate_daily_calories 2000, calories
    circumference percent
  end

  def circumference (percent)
    percent = percent.to_f

    circle = Hash.new
    circumference = calculate_circumference

    circle["line"] = circumference*(percent/100)
    circle["space"] = circumference*((100-percent)/100)

    circle
  end

  private
  def create_chart
    values = []
    @nutritions.each do |key, value|
      values.push({
        :value => value,
        :percent =>  calculate_daily_calories(10, value),
        :ingredient => key
      })
    end

    values
  end


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


