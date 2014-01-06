module ApplicationHelper
  def print_nutrition_element? key
    DailyIntake.find_element key
  end
end
