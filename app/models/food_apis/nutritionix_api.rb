require_dependency 'food_apis/food_api_interface'
require 'awesome_print'
require 'nutritionix/api_1_1'


class NutritionixAPI < FoodAPIInterface
  def initialize
    I18n.locale = :nutritionix
    @app_id = '3f0f5d7f'
    @app_key = '96802c411ee8f2ba80568c157238d980'
    @provider = Nutritionix::Api_1_1.new(@app_id, @app_key)
  end

  def search(api_key, query)
    search_params = {
        offset: 0,
        limit: 2,
        query: query
    }

    results_json = @provider.nxql_search(search_params)
    results_json = JSON.parse(results_json)

    (parse_data_search(results_json, api_key)) unless results_json.nil?
  end

  def get_item(api_key, item_id)
    item = @provider.get_item item_id.to_s #if id is not a string you will receive undefined encoding
    parse_data_item item, api_key
  end

  private
  def parse_data_item (item, api_key)
    ap JSON.parse(item)
    food = create_food_item_structure ({
        :name => "#{item['item_name']} #{item['brand_name']}",
        :api_key => api_key,
        :item_id => item['_id'],
        :object_source_id => self.object_id,
        :serving_weight => {
            :unit => 'g',
            :value => item['nf_serving_weight_grams']
        }
    })
    food[:nutritions] = parse_single_item JSON.parse(item), food[:serving_weight]
    food
  end

  # todo
  # find out in which mass the given values are given
  def parse_data_search (data, api_key)
    parsed_data = Array.new

    data['hits'].each do |item|
      food = create_food_item_structure ({
        :name => "#{item['_source']['item_name']} #{item['_source']['brand_name']}",
        :api_key => api_key,
        :item_id => item['_id'],
        :object_source_id => self.object_id,
        :serving_weight => {
            :unit => 'g',
            :value => item['_source']['nf_serving_weight_grams']
        }
      })

      item['_source'].delete('item_name')
      item['_source'].delete('brand_name')

      food[:nutritions] = parse_single_item item['_source'], food[:serving_weight]

      parsed_data.push(food)
    end
    parsed_data
  end

  ##
  # parses the nutrition data from a single item and translates the key
  # @param source - source array of elements
  def parse_single_item(source, serving_weight)
    nutrition_elements = {}
    source.each do |key, ingredients|
       if is_valid_pair? key, ingredients
         key = translate_key key, :nutritionix

         nutrition_elements[key] = base_nutrition_information ingredients, serving_weight
       end
    end
    nutrition_elements
  end

  # checks a given pair on following things
  # starts key with nf_ (for nutrition information)
  # is value wether 0 or nil
  def is_valid_pair? key, value
    return true unless value.nil? || value == 0 || !key.include?('nf_')
  end
end