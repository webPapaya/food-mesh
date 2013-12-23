require_dependency 'food_apis_module'

class LineChart < ActiveRecord::Base
  include FoodApisModule

  def initialize(window_width = 500, window_height = 1000)
    get_values
    @values = {
        "fat" => 100,
        "calories" => 200,
        "protein" => 490,
        "calcium" => 300,
        "sugar" => 310,
        "water" => 390,
        "alcohol" => 250,
        "vitamin_c" => 300,
        "vitamin_a" => 290,
        "iron" => 300,
    }
    @window_height = window_width
    @window_width = window_height
  end


  def get_line_chart
    {
      :init => initialize,
      :draw => draw_function

     }
  end



  def get_values
    logger.debug("___________________________________________")
    #@results = search_apis [:query]
    #api_id = params[:api_id].to_i food_id = params[:food_id]
    #@results = get_item(api_id, food_id)
    #logger.debug(@results)
  end

  def draw_function



    @path = "M 0 #{@window_height}"
    i = 0

    @values.each do |key, value|
      @path << " L #{i*100}  #{value}"
      i+=1
    end

    @path << "L #{@window_width} #{@window_height} Z"

    @debug = @path
  end
end
