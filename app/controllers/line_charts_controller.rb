class LineChartsController < ApplicationController

  def index
    @window_width = 1000
    @window_height = 500

    #@start_x = 0
    #@start_y = 900

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

    @values2 = {
        "fat" => 300,
        "calories" => 440,
        "protein" => 190,
        "calcium" => 350,
        "sugar" => 210,
        "water" => 290,
        "alcohol" => 190,
        "vitamin_c" => 200,
        "vitamin_a" => 390,
        "iron" => 100,
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

      logger.debug@x2[index + 1] =  (@base_line) * (index)
      logger.debug@y2[index + 1] = @window_height - value

      if index == 0
        logger.debug@x1[index] = 0
        logger.debug@y1[index] =  @window_height - value
        logger.debug@x2[index] = @base_line
        logger.debug@y2[index] = 300   # @y2[index + 1 ] => value
      else
        logger.debug@x1[index] = @x2[index + 1]
        logger.debug@y1[index] = @y2[index + 1]

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

      logger.debug@x_2[index + 1] =  (@base_line) * (index)
      logger.debug@y_2[index + 1] = @window_height - value

      if index == 0
        logger.debug@x_1[index] = 0
        logger.debug@y_1[index] =  @window_height - value
        logger.debug@x_2[index] = @base_line
        logger.debug@y_2[index] = 60   # @y_2[index + 1 ] => value
      else
        logger.debug@x_1[index] = @x_2[index + 1]
        logger.debug@y_1[index] = @y_2[index + 1]

      end
    end
  end
end
