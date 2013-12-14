class LineChartsController < ApplicationController

  def index
    @window_width= 1000
    @window_height = 1000

    @start_x = 0
    @start_y = 900

    @values = {
        "value1" => 400,
        "value2" => 140,
        "value3" => 580,
        "value4" => 180,
        "value5" => 80,
        "value6" => 300
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

      logger.debug@x2[index] =  (@base_line/2) * (index + 1)
      logger.debug@y2[index] = @start_y - value

      if index == 0
        logger.debug@x1[index] = @start_x
        logger.debug@y1[index] = @start_y
      else
        logger.debug@x1[index] = @x2[index - 1]
        logger.debug@y1[index] = @y2[index - 1]

      end
    end
  end
end
