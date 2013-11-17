module FoodData
  def test
    puts "skfjaldsöf"
  end
end


class FddbData
  attr_accessor :debug


  include FoodData

  def initialize
    @api_key = 'U9H3TXH05S933NMQFMJIL64C'

  end

  def get_data
    params = {
        :apikey => @api_key,
        :q => 'banane',
        :lang => 'de'
    }

    data = Curl::Easy.http_post('http://fddb.info/api/v8/search/item.xml?' + params.to_query).

    data
  end
end