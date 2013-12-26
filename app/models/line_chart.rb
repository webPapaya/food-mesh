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
      # multiplication factor 20 just for a better illustration
      ingredients["kcal"] = (100/(2500 / item[:nutritions]["kcal"])) * 20
      ingredients["fat"] =  (100/(92.5/item[:nutritions]["fat"])) * 20
      ingredients["saturated_fat"] = (100/(16/item[:nutritions]["saturated_fat"])) * 20
      ingredients["protein"] =  (100/(78/item[:nutritions]["protein"])) * 20
      ingredients["sugar"] =  (100/(62.2/item[:nutritions]["sugar"])) * 20
      ingredients["carbohydrate"] = (100/(313/item[:nutritions]["carbohydrate"])) * 20
      ingredients["fiber"] =  (100/(15/item[:nutritions]["fiber"])) * 20
      ingredients["sodium"] =  (100/(2400/item[:nutritions]["sodium"])) * 20
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
