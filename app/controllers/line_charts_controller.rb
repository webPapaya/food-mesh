class LineChartsController < ApplicationController

  def index
    @window_width= 1000
    @window_height = 1000

    @start_x = 0
    @start_y = 500

    values = {
        "value1" => 202,
        "value2" => 94,
        "value3" => 58,
        "value4" => 58,
        "value5" => 58,
        "value6" => 208
    }


    # base line of every triangle
    @base_line = @window_width/values.length

    array = [400, 300, 100,  250, 50,  400]

    # hash with name of
    values.each do|name,value|
      puts "#{name}: #{value}"

      @draw_x =  @base_line*2
      @draw_y = @start_y - value

    end

  end
end
