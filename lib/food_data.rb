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


    data
  end

  def search_query query
    #params = {
    #    :apikey => @api_key,
    #    :q => query,
    #    :lang => 'de'
    #}
    #
    #data = Curl::Easy.http_post('http://fddb.info/api/v8/search/item.xml?' + params.to_query).body_str
    #
    #parse_xml(data)
  end

  def parse_xml (data)

    object = Array.new
    xmlObj = Nokogiri::XML(data)

    xmlObj.xpath("shortitem").each do |item|
      object.add(item)
    end

    xmlObj
  end
end