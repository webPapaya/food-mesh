require_dependency 'food_apis_module'

class LineChart < ActiveRecord::Base

  def initialize
    @window_height = 500
    @window_width = 1000
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
  end


  def get_line_chart
    {
      :init => initialize,
      #:values => get_values,
      :draw => draw_function

     }
  end


  def get_values

    @value = {
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
    #[{
    #     "name"=>"Tilapia (Fish)",
    #     "amount"=>"Per 100g",
    #     "object_source_id" => 70157557973400,   # no comma and arrow
    #     "nutritions"=>{
    #         "Calories"=>"96kcal",
    #         "Fat"=>"1.70g",
    #         "Carbs"=>"0.00g",
    #         "Protein"=>"20.08g"
    #     }
    # }]

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
