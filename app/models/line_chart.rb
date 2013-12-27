class LineChart
  def initialize(window_width = 1000, window_height = 500)
    @dimensions = {
        :width => window_width,
        :height => window_height
    }
  end

  def convert_to_percent ingredients, items
    items.each do |item, index|
      ingredients["kcal"] = (100/(2500/ingredients["kcal"]))
      ingredients["fat"] =  (100/(92.5/ingredients["fat"]))
      ingredients["saturated_fat"] = (100/(16/ingredients["saturated_fat"]))
      ingredients["protein"] =  (100/(78/ingredients["protein"]))
      ingredients["sugar"] =  (100/(62.2/ingredients["sugar"]))
      ingredients["carbohydrate"] = (100/(313/ingredients["carbohydrate"]))
      ingredients["fiber"] =  (100/(15/ ingredients["fiber"]))
      ingredients["sodium"] =  (100/(2400/ingredients["sodium"]))
      #item[:path] = draw_function ingredients
    end
  end

  def build_paths(items)

    ingredients = {}

    items.each_with_index do |item, index|
      # .to_f prevents from getting nil into line chart

      ingredients["kcal"] = item[:nutritions]["kcal"].to_f
      ingredients["fat"] =  item[:nutritions]["fat"].to_f
      ingredients["saturated_fat"] = item[:nutritions]["saturated_fat"].to_f
      ingredients["protein"] =  item[:nutritions]["protein"].to_f
      ingredients["sugar"] = item[:nutritions]["sugar"].to_f
      ingredients["carbohydrate"] = item[:nutritions]["carbohydrate"].to_f
      ingredients["fiber"] = item[:nutritions]["fiber"].to_f
      ingredients["sodium"] = item[:nutritions]["sodium"].to_f
      convert_to_percent ingredients, items
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
    end
    path << "L #{@dimensions[:width]} #{@dimensions[:height]} Z"
  end
end
