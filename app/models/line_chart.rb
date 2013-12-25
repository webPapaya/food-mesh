class LineChart < ActiveRecord::Base
  def initialize(window_width = 1000, window_height = 500)
    @dimensions = {
        :width => window_width,
        :height => window_height
    }
  end

  def build_paths(items)
    items.each do |item|
      item[:path] = draw_function item[:nutritions]
    end
  end

  def draw_function(nutritions)
    space = 500/nutritions.length
    path = "M 0 #{@dimensions[:height]}"
    i = 0
    nutritions.each do |key, value|
      path << " L #{i*space}  #{@dimensions[:height]-value} "
      i+=1
    end
    path << "L #{@dimensions[:width]} #{@dimensions[:height]} Z"
  end
end
