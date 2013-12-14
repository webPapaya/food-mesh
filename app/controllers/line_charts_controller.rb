class LineChartsController < ApplicationController

  def index
    @window_width= 1000
    @window_height = 1000

    #@start_x = 0
    #@start_y = 500

    @values = {
        "value1" => 200,
        "value2" => 940,
        "value3" => 580,
        "value4" => 580,
        "value5" => 80,
        "value6" => 300
    }

    # base line of every triangle
    @base_line = @window_width/@values.length

    #array = [400, 300, 100,  250, 50,  400]


    @start_x = {}
    #@start_x = Array.new
    @start_y = {}
    @draw_x = {}
    @draw_y = {}
    #book_list = gets.chomp
   # books = book_list.split(',')


    # hash with name of
    @values.each_with_index do|(name, value), index|

      logger.debug"#{name}, #{value} => #{index}"
      logger.debug@start_x[index] = value
      logger.debug@start_y[index] = value
      logger.debug@draw_x[index] =  @base_line
      logger.debug@draw_y[index] = @start_y
    end
    logger.debug@start_y[0]
    logger.debug@start_y[0]
    logger.debug@start_y[0]
    logger.debug@start_x[1]
    logger.debug@start_x[3]
  end
end
