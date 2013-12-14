class LineChartsController < ApplicationController

  def index
    @window_width = 1000
    @window_height = 500

    #@start_x = 0
    #@start_y = 900

    @values = {
        "value1" => 0,
        "value2" => 400,
        "value3" => 0,
        "value4" => 400,
        "value5" => 0,
        "value6" => 400,
        "value7" => 0,
        "value8" => 400,
        "value9" => 0,
        "value10" => 400
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
