I18n.locale = :fddb
I18n.enforce_available_locales = false

class Fddb
  def initialize
    @api_key = 'U9H3TXH05S933NMQFMJIL64C'
  end

  def parse_xml (data)
    object = Array.new
    xmlObj = Nokogiri::XML(data)

    xmlObj.xpath("//item/data//*[not(text())]").remove #remove all empty nodes
    xmlObj.xpath("//item").each do |item|
      food_item = Hash.new
      food_item['name'] = item.xpath("./description/name")[0].content


      amount = item.xpath("./data/amount")
      amount_mesureing_sytem = item.xpath("./data/amount_measuring_system")
      food_item['amount'] = amount[0].content
      food_item['amount_mesureing_sytem'] = amount_mesureing_sytem[0].content

      #remove mesuring_sytem from node list
      amount.remove
      amount_mesureing_sytem.remove

      #loop through nutrition data
      food_item['nutritions'] = Hash.new
      item.xpath("./data/*").each do |ingredient|

        food_item['nutritions'][t(ingredient.name)] = ingredient.content
      end
      object.push(food_item)
      break
    end

    object
  end

  def search query
    params = {
        :apikey => @api_key,
        :q => query,
        :lang => 'de'
    }

    data = Curl::Easy.http_post('http://fddb.info/api/v8/search/item.xml?' + params.to_query).body_str
    puts 'http://fddb.info/api/v8/search/item.xml?' + params.to_query


    parse_xml data
  end

  private
    def t key
      key.slice! "_gram"
      I18n.t(key)
    end
end