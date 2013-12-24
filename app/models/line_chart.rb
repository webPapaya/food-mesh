require_dependency 'food_apis_module'

class LineChart < ActiveRecord::Base

  def initialize(window_width = 500, window_height = 1000)
    logger.debug(@line_chart)
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

  #def contain_values(nutritions)
    #  @nutritions = nutritions
    #logger.debug(h[:nutritions])
    #@results.each do |h|
      #@name = h[:name]; logger.debug(@name)
      #logger.debug("kj"); logger.debug( h[:nutritions]["kj"])
      #logger.debug("kcal");logger.debug(h[:nutritions]["kcal"])
      #logger.debug("fat"); logger.debug(h[:nutritions]["fat"])
      #logger.debug("saturated_fat"); logger.debug(h[:nutritions]["saturated_fat"])
      #logger.debug("protein"); logger.debug(h[:nutritions]["protein"])
      #logger.debug("carbohydrate"); logger.debug(h[:nutritions]["carbohydrate"])
      #logger.debug("sugar"); logger.debug(h[:nutritions]["sugar"])
      #logger.debug("fiber"); logger.debug(h[:nutritions]["fiber"])
      #logger.debug("sodium"); logger.debug(h[:nutritions]["sodium"])
    #end
  #end

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
