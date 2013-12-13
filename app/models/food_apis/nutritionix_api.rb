require_dependency 'food_apis/food_api_interface'
require_dependency 'food_apis/food_apis_helper'
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

  def get_item(api_id, id)
    data = @provider.get_item id.to_s #if id is not a string you will receive undefined encoding
    parse_data_item data
  end

  private

  def parse_data_item data
    food = Hash.new
    food['name'] = data['item_name']
    food['nutritions'] = Hash.new

    JSON.parse(data).each do |key, ingredient|
      if is_valid_pair? key, ingredient
        key = I18n.t key, locale: :nutritionix
        food['nutritions'][key] = ingredient
      end
    end

    food
  end

  # todo
  # find out in which mass the given values are given
  def parse_data_search (data, api_key)
    parsed_data = Array.new

    data['hits'].each do |item|
      food = Hash.new
      food['name'] = "#{item['_source']['item_name']} #{item['_source']['brand_name']}"
      food['api_key'] = api_key
      food['item_id'] = item['_id']
      food['object_source_id'] = self.object_id

      item['_source'].delete('item_name')
      item['_source'].delete('brand_name')

      food['nutritions'] = Hash.new

      item['_source'].each do |key, ingredients|
          if is_valid_pair? key, ingredients

            key = I18n.t key, locale: :nutritionix
            food['nutritions'][key] = ingredients
          end
      end

      parsed_data.push(food)
    end
    parsed_data
  end

  # checks a given pair on following things
  # starts key with nf_ (for nutrition information)
  # is value wether 0 or nil
  def is_valid_pair? key, value
    return true unless value.nil? || value == 0 || !key.include?('nf_')
  end
end