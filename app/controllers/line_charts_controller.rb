class LineChartsController < ApplicationController

  def index
    @window_width = 1000
    @window_height = 500

    #@start_x = 0
    #@start_y = 900

    @values = {
        "value1" => 100,
        "value2" => 100,
        "value3" => 290,
        "value4" => 200,
        "value5" => 310,
        "value6" => 390,
        "value7" => 250,
        "value8" => 300,
        "value9" => 290,
        "value10" => 500
    }

    @values2 = {
        "value1" => 300,
        "value2" => 440,
        "value3" => 190,
        "value4" => 350,
        "value5" => 210,
        "value6" => 290,
        "value7" => 190,
        "value8" => 200,
        "value9" => 390,
        "value10" => 100
    }


    draw_line(@values)
    draw_line2(@values2)

  end


  def draw_line(values)
    @base_line = @window_width/@values.length

    @x1 = {}
    @y1 = {}
    @x2 = {}
    @y2 = {}

    # hash with name of ingedient, amount and index
    values.each_with_index do|(name, value), index|

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

  def draw_line2(values)
    @base_line = @window_width/@values.length

    @x_1 = {}
    @y_1 = {}
    @x_2 = {}
    @y_2 = {}

    # hash with name of ingedient, amount and index
    values.each_with_index do|(name, value), index|

      logger.debug"#{name}, #{value} => #{index}"

      logger.debug@x_2[index] =  (@base_line) * (index)
      logger.debug@y_2[index] = @window_height - value

      if index == 0
        logger.debug@x_1[index] = 0
        logger.debug@y_1[index] =  @window_height - value
      else
        logger.debug@x_1[index] = @x_2[index - 1]
        logger.debug@y_1[index] = @y_2[index - 1]

      end
    end
  end
end
