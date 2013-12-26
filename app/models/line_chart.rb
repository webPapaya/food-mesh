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

      ingredients["kcal"] = (100/(2500/item[:nutritions]["kcal"]).ceil) * 20
      ingredients["fat"] =  (100/(92.5/item[:nutritions]["fat"]).ceil) * 20
      ingredients["saturated_fat"] = (100/(16/item[:nutritions]["saturated_fat"]).ceil) * 20
      ingredients["protein"] =  (100/(78/item[:nutritions]["protein"]).ceil) * 20
      ingredients["sugar"] =  (100/(62.2/item[:nutritions]["sugar"]).ceil) * 20
      ingredients["carbohydrate"] = (100/(313/item[:nutritions]["carbohydrate"]).ceil) * 20
      ingredients["fiber"] =  (100/(15/item[:nutritions]["fiber"]).ceil) * 20
      ingredients["sodium"] =  (100/(2400/item[:nutritions]["sodium"]).ceil) * 20

      item[:path] = draw_function ingredients
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
