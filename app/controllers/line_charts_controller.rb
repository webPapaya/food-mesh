class LineChartsController < ApplicationController

  def index
    @window_width= 1000
    @window_height = 1000

    @start_x = 0
    @start_y = 500

    @values = {
        "value1" => 200,
        "value2" => 940,
        "value3" => 580,
        "value4" => 580,
        "value5" => 80,
        "value6" => 200
    }


    # base line of every triangle
    @base_line = @window_width/@values.length

    #array = [400, 300, 100,  250, 50,  400]

    # hash with name of
    @values.each_with_index do|(name, value), index|

      @draw_x =  @base_line*2
      @draw_y = @start_y - value
      @variable = "#{value} => #{index}"

    end

  end
end
