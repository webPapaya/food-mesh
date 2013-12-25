require_dependency 'food_apis_module'

class LineChart < ActiveRecord::Base
  def initialize(window_width = 500, window_height = 1000)
    @window_height = window_width
    @window_width = window_height
  end

  def build_paths(items)
    items.each do |item|
      item[:path] = draw_function item[:nutritions]
    end
    items
  end

  def draw_function(nutritions)
    path = "M 0 #{500}"
    space = 500/nutritions.length

    i = 0
    nutritions.each do |key, value|
      path << " L #{i*space}  #{500-value}"
      i+=1
    end

    path << "L #{@window_width} #{@window_height} Z"
  end
end
