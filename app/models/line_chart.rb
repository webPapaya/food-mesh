class LineChart < ActiveRecord::Base
  def initialize(window_width = 1000, window_height = 500)
    @dimensions = {
        :width => window_width,
        :height => window_height
    }
  end

  def build_paths(items)
    ingredients = {}
    items.each_with_index do |item, index|
      ingredients["kcal"] =  item[:nutritions]["kcal"]
      #ingredients["kj"] =  item[:nutritions]["kj"]
      ingredients["fat"] =  item[:nutritions]["fat"]
      ingredients["saturated_fat"] =  item[:nutritions]["saturated_fat"]
      ingredients["protein"] =  item[:nutritions]["protein"]
      ingredients["sugar"] =  item[:nutritions]["sugar"]
      ingredients["carbohydrate"] =  item[:nutritions]["carbohydrate"]
      ingredients["fiber"] =  item[:nutritions]["fiber"]
      ingredients["sodium"] =  item[:nutritions]["sodium"]
      logger.debug(ingredients)
      item[:path] = draw_function ingredients
    end
  end

  def draw_function(ingredients)
    space = 500/ingredients.length
    path = "M 0 #{@dimensions[:height]}"
    i = 0
    ingredients.each do |key, value|
      path << " L #{i*space}  #{@dimensions[:height]-value} "
      i+=1
    end
    path << "L #{@dimensions[:width]} #{@dimensions[:height]} Z"
  end
end
