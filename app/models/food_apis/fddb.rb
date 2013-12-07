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