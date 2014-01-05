module FoodItemHelper
  def get_label_coords(current_coords)
    return (@pie_chart[:chart_center]-(@pie_chart[:chart_width] + 100))if (current_coords < @pie_chart[:chart_center])
    @pie_chart[:chart_center]+(@pie_chart[:chart_width] + 100)
  end

  def calc_label_circle(coord, factor=0.3)
    coord * (1+factor) - (@pie_chart[:chart_center] * factor)
  end


end
