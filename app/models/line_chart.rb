class LineChart < ActiveRecord::Base
  def initialize(window_width = 1000, window_height = 500)
    @dimensions = {
        :width => window_width,
        :height => window_height
    }
  end

  def convert_to_percent ingredients, items
    items.each do |item, index|
      ingredients["kcal"] = (100/(2500/ingredients["kcal"])) * 15
      ingredients["fat"] =  (100/(92.5/ingredients["fat"])) * 15
      ingredients["saturated_fat"] = (100/(16/ingredients["saturated_fat"])) * 15
      ingredients["protein"] =  (100/(78/ingredients["protein"])) * 15
      #ingredients["sugar"] =  (100/(62.2/ingredients["sugar"]).ceil) * 15
      #ingredients["carbohydrate"] = (100/(313/ingredients["carbohydrate"]).to_i) * 15
      ingredients["fiber"] =  (100/(15/ ingredients["fiber"])) * 15
      #ingredients["sodium"] =  (100/(2400/ingredients["sodium"]).to_i) * 15
      #logger.debug(ingredients)
      #item[:path] = draw_function ingredients
    end
  end

  def build_paths(items)

    ingredients = {}

    items.each_with_index do |item, index|
      # multiplication factor 15 just for a better illustration

      ingredients["kcal"] = item[:nutritions]["kcal"]
      ingredients["fat"] =  item[:nutritions]["fat"]
      ingredients["saturated_fat"] = item[:nutritions]["saturated_fat"]
      ingredients["protein"] =  item[:nutritions]["protein"]
      ingredients["sugar"] = item[:nutritions]["sugar"]
      ingredients["carbohydrate"] = item[:nutritions]["carbohydrate"]
      ingredients["fiber"] = item[:nutritions]["fiber"]
      ingredients["sodium"] = item[:nutritions]["sodium"]
      logger.debug(ingredients)
      convert_to_percent ingredients, items
    end

  end


  def draw_function(ingredients)
    space = @dimensions[:width]/ingredients.length
    path = "M 0 #{@dimensions[:height]}"
    i = 0
    ingredients.each do |key, value|
      path << " L #{i*space}  #{@dimensions[:height]-value} "
      i+=1
      @values = key
      logger.debug(@values)
    end
    path << "L #{@dimensions[:width]} #{@dimensions[:height]} Z"
  end
end
