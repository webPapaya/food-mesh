##
# food_item_helper.rb
#
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	    Multimediaprojekt 2a (MMP2a)
# author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
#              - Franziska Oberhauser

module FoodItemHelper
  def get_label_coords(current_coords)
    return (@pie_chart[:chart_center]-(@pie_chart[:chart_width] + 100))if (current_coords < @pie_chart[:chart_center])
    @pie_chart[:chart_center]+(@pie_chart[:chart_width] + 100)
  end

  def calc_label_circle(coord, factor=0.3)
    coord * (1+factor) - (@pie_chart[:chart_center] * factor)
  end

  def next_item idx
    next_idx = idx + 1
    return 0 if @pie_chart[:line_coords][next_idx].nil?
    next_idx
  end

  def print_nutrition_element?(key, value)
    intake = DailyIntake.find_element(key)
    return false if intake.nil?
    #unless intake.nil?
    #  return nil if key == 'calories'
    #  val = value.to_f/intake['value']
    #  mask = create_outer_mask
    #  val *= (mask['outer'] - mask['inner'])
    #  val += mask['inner']
    #  return val
    #end

    true
  end
end
