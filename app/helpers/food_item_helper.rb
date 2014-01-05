module FoodItemHelper
  def get_label_coords(current_coords)
    if current_coords
      current_coords -= 33 if (current_coords < @pie_chart[:chart_center])
    end
    calc_label_circle current_coords
  end

  def calc_label_circle(coord)
    coord * 1.3 - (@pie_chart[:chart_center] * 0.3)
  end
end
