class LineChartsController < ApplicationController

  # GET /basic_pages
  # GET /basic_pages.json
  def index
    @window_width= 1000
    @window_height= 1000

    @start_x = 0
    @start_y = 500

    # assumed values coming from the database
    @first_db_value = 400   # example 400 calories
    @second_db_value = 300
    @fourth_db_value = 100

    @data_amount = 6  # example 6 different values from database



    # base line of every triangle
    @base_line = @window_width/@data_amount

    #@path_length = (Math.sqrt(((@base_line/2)**2) * (@db_value**2))).ceil


    @second_x = @base_line/2
    @second_y = @start_y - @first_db_value
    @third_x =  @base_line #@base_line/4
    @third_y =  Math.sqrt((@start_y - @first_db_value - @second_db_value)**2)
    @fourth_x = @base_line+@base_line/2  #wrong calculatun -> x-values alwas get added
    @fouth_y = @start_y - @fourth_db_value
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
