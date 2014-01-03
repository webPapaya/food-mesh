require 'set'
class LineChart
  def initialize(items, window_width = 1000, window_height = 500)
    @dimensions = {
        :width => window_width,
        :height => window_height
    }
    @items = items
    @nutritions_in_items = combine_items
  end

  def self.get_chart items
    @chart = LineChart.new items
    @chart.build_chart
  end

  def build_chart
    paths = []
    @items.each do |item|
      paths << (draw_function item['nutritions'])
    end
    paths
  end

  def draw_function(ingredients)
    space = @dimensions[:width]/@nutritions_in_items.length
    path = "M 0 #{@dimensions[:height]}"

    @nutritions_in_items.each_with_index do |nutrition, i|
      value = (ingredients[nutrition].presence or 0)
      path << " L #{i*space}  #{@dimensions[:height]- value} "
    end
    path << "L #{@dimensions[:width]} #{@dimensions[:height]} Z" #close path
    ap path
    path
  end


  private
  def combine_items
    nutritions_in_items = Set.new
    @items.each do |item|
      item['nutritions'].each do |key, value|
        nutritions_in_items.add key if value > 0
      end
    end
    nutritions_in_items
  end
end
