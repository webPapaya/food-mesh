class LineChartsController < ApplicationController

  def index
    @window_width = 1000
    @window_height = 500

    #@start_x = 0
    #@start_y = 900

    @values = {
        "value1" => 400,
        "value2" => 300,
        "value3" => 290,
        "value4" => 200,
        "value5" => 310,
        "value6" => 390,
        "value7" => 250,
        "value8" => 300,
        "value9" => 290,
        "value10" => 500
    }

    # base line of every triangle
    @base_line = @window_width/@values.length

    @x1 = {}
    @y1 = {}
    @x2 = {}
    @y2 = {}


    # hash with name of
    @values.each_with_index do|(name, value), index|

      logger.debug"#{name}, #{value} => #{index}"

      logger.debug@x2[index] =  (@base_line) * (index)
      logger.debug@y2[index] = @window_height - value

      if index == 0
        logger.debug@x1[index] = 0
        logger.debug@y1[index] =  @window_height - value
      else
        logger.debug@x1[index] = @x2[index - 1]
        logger.debug@y1[index] = @y2[index - 1]

      end
    end
  end
end
