class LineChartsController < ApplicationController

  # GET /basic_pages
  # GET /basic_pages.json
  def index
    @window_width= 1000
    @window_height= 1000

    @start_x = 0
    @start_y = 200

    # assumed values coming from the database
    @db_value = 500   # example 20 gram of protein
    @data_amount = 6  # example 6 different values from database



    # base line of every triangle
    @base_line = @window_width/@data_amount

    #@path_length = (Math.sqrt(((@base_line/2)**2) * (@db_value**2))).ceil


    @second_x = @base_line/2
    @second_y = 500 - @db_value
    #@third_x = 400
    #@third_y = 400
  end

  def init
    #@start_x = 100
    #@start_y = 500
  end

  def draw
    #@second_x = 500
    #@second_y = 0
    #@third_x =
  end
end
