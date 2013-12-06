require 'fatsecret'


class PieChart < ActiveRecord::Base
  attr_reader :values, :width_height, :segments, :inner_angle, :pie_chart_mask, :colors

  include FoodAPIs

  def initialize (width_height=500, segments=10)
    @random = Random.new
    @values = create_dummy_chart
    @width_height = width_height
    @segments = segments
    @inner_angle  = 360 / @segments
    @radiant = deg_to_rad(@inner_angle)
    @pie_chart_mask = create_outer_mask

    @colors = %w[#2BA772 #1C7F60 #19436B #F7B475 #50B694 #66A4D1 #205779 #3997CF #2BA772']

  end

  def get_food query
    search(query)
  end

  def create_dummy_chart
    values = Array.new
    (0..5).each do |i|
      values[i] = Random.rand(100)
    end
    values
  end

  def get_coords
    coords = Hash.new

    coords['x1'] = Math.cos(@radiant).abs * (@width_height) + @width_height/2
    coords['y1'] = Math.sin(@radiant).abs * (@width_height) + @width_height/2

    coords['x2'] = @width_height
    coords['y2'] = @width_height / 2

    coords
  end

  def center
    @width_height/2
  end

  def create_outer_mask
    mask = Hash.new

    mask['inner'] = @width_height.to_f/10
    mask['outer'] = @width_height.to_f

    mask
  end

  def circumference
    procent = 40.0
    circle = Hash.new
    circumference = calculate_circumference

    circle["line"] = circumference*(procent/100) - 5
    circle["space"] = circumference*((100-procent)/100) - 5

    circle
  end

  private
    def deg_to_rad (deg)
      Math::PI/180 * deg
    end

    def calculate_circumference
      2*Math::PI*(@width_height)
    end
end








####################

module FoodAPIs
  @@apis = [Fddb.new];

  def search(query)
    result = ""
    @@apis.each do |api|
      result += api.search query
    end
    result
  end
end



class Fsecret
  def initialize
    FatSecret.init('e2310b092c9f4acbb43657f59c242245', '3d0cc9b6114741bbbfe6c2510e8913c3')
  end

  def search query
    parse_data(FatSecret.search_food(query)).to_s
  end

  ##
  # todo calculate nutritions per 100g
  #

  private
  def parse_data data
    parsed_data = []
    data["foods"]["food"].each do |item|
        tmp = item["food_description"].split(" - ")
        desc = tmp[1]


        food = Hash.new
        food["name"] = item["food_name"]
        food ["amount"] = tmp[0]
        food["nutritions"] = Hash.new

        ingredients = desc.split(" | ")
        ingredients.each do |ingredient|
          tmp = ingredient.split(": ")
          food["nutritions"][tmp[0]] = tmp[1]
        end
        parsed_data.push(food)
    end

    parsed_data.to_s
  end

end


class Fddb
  def initialize
    @api_key = 'U9H3TXH05S933NMQFMJIL64C'
  end

  def parse_xml (data)
    object = Array.new
    xmlObj = Nokogiri::XML(data)

    #xmlObj.xpath("//item/data//*[not(text())]").remove
    #
    #xmlObj.xpath("//item/data").each do |item|
    #  item.xpath("//*").select{|n| n.inner_text}.each do |ingredient|
    #    if ingredient.empty?
    #      name = ingredient.name
    #      amount = ingredient.content
    #      puts amount
    #    end
    #  end
    #end

    object.to_s
  end

  def search query
    params = {
        :apikey => @api_key,
        :q => query,
        :lang => 'de'
    }

    data = Curl::Easy.http_post('http://fddb.info/api/v8/search/item.xml?' + params.to_query).body_str



    parse_xml data
  end
end

