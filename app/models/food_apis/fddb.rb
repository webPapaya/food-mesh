require_dependency 'food_apis/food_api_interface'
require_dependency 'food_apis/food_apis_helper'
require 'nokogiri'


class Fddb < FoodAPIInterface
  def initialize
    @api_key = 'U9H3TXH05S933NMQFMJIL64C'
  end

  def search(api_key, query)
    #params = {
    #    :apikey => @api_key,
    #    :q => query,
    #    :lang => 'de'
    #}
    #
    ##puts 'http://fddb.info/api/v8/search/item.xml?' + params.to_query
    #
    #data = Curl::Easy.http_post('http://fddb.info/api/v8/search/item.xml?' + params.to_query).body_str


    (parse_xml data, api_key) unless data.nil?
  end

  def get_item id
    params = {
        :apikey => @api_key,
        :lang => 'de'
    }

    url = "http://fddb.info/api/v8/item/id_#{id}.xml?#{ params.to_query }"
    data = Curl::Easy.http_post(url).body_str

    (parse_xml data) unless data.nil?
  end

  private
    def parse_xml (data, api_key)
      object = Array.new
      xmlObj = Nokogiri::XML(data)

      xmlObj.xpath("//item/data//*[not(text())]").remove #remove all empty nodes
      xmlObj.xpath("//item").each do |item|
        food_item = Hash.new
        food_item['name'] = item.xpath("./description/name")[0].content
        food_item['object_source_id'] = self.object_id
        food_item['item_id'] = item.xpath("./id")[0].content


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

          key = I18n.t ingredient.name, locale: :fddb
          food_item['nutritions'][key] = ingredient.content
        end
        object.push(food_item)
      end

      object
    end
  end
