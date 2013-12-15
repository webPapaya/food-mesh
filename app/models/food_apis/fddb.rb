require_dependency 'food_apis/food_api_interface'
require 'nokogiri'


class Fddb < FoodAPIInterface
  def initialize
    @api_key = 'U9H3TXH05S933NMQFMJIL64C'
  end

  def search(api_id, query)
    params = {
        :apikey => @api_key,
        :q => query,
        :lang => 'de'
    }

    #puts 'http://fddb.info/api/v8/search/item.xml?' + params.to_query

    data = Curl::Easy.http_post('http://fddb.info/api/v8/search/item.xml?' + params.to_query).body_str
    (parse_xml api_id, data) unless data.nil?
  end

  def get_item(api_id, id)
    params = {
        :apikey => @api_key,
        :lang => 'de'
    }

    url = "http://fddb.info/api/v8/item/id_#{id}.xml?#{ params.to_query }"
    data = Curl::Easy.http_post(url).body_str

    (parse_xml api_id, data) unless data.nil?
  end

  private

    def parse_xml (api_id, data)
      object = Array.new
      xml_obj = Nokogiri::XML(data)

      xml_obj.xpath("//item/data//*[not(text())]").remove #remove all empty nodes
      xml_obj.xpath("//item").each do |item|
        food_item = create_food_item_structure ({
          :name => item.xpath("./description/name")[0].content,
          :api_key => api_id,
          :item_id => item.xpath("./id")[0].content,
          :object_source_id => self.object_id
        })

        amount = item.xpath("./data/amount")
        amount_mesureing_sytem = item.xpath("./data/amount_measuring_system")
        food_item['amount'] = amount[0].content
        food_item['amount_mesureing_sytem'] = amount_mesureing_sytem[0].content

        #remove mesuring_sytem from node list
        amount.remove
        amount_mesureing_sytem.remove

        item.xpath("./data/*").each do |ingredient|
          key = translate_key ingredient.name, :fddb
          food_item[:nutritions][key] = ingredient.content
        end

        ap food_item

        object.push(food_item)
      end

      object
    end
  end
