require 'nutritionix/api_1_1'
require_dependency 'food_apis/food_apis_helper'


I18n.locale = :nutritionix
I18n.enforce_available_locales = false


class NutritionixAPI
  def initialize
    @app_id = '3f0f5d7f'
    @app_key = '96802c411ee8f2ba80568c157238d980'
    @provider = Nutritionix::Api_1_1.new(@app_id, @app_key)
  end

  def search query
    search_params = {
        offset: 0,
        limit: 2,
        query: query
    }
    results_json = @provider.nxql_search(search_params)
    results_json = JSON.parse(results_json)

    parse_data results_json
  end

  def get_item
    puts self.object_id
  end

  private
    include FoodAPIsHelper

  # todo
  # find out in which mass the given values are given
  def parse_data data
    parsed_data = Array.new

    data['hits'].each do |item|
      food = Hash.new
      food['name'] = "#{item['_source']['item_name']} #{item['_source']['brand_name']}"
      food['object_source_id'] = self.object_id

      item['_source'].delete('item_name')
      item['_source'].delete('brand_name')

      food['nutritions'] = Hash.new

      item['_source'].each do |key, ingredients|
          if is_valid_pair key, ingredients
            food['nutritions'][I18n.t(key)] = ingredients
          end
      end

      parsed_data.push(food)
    end
    parsed_data
  end

  # checks a given pair on following things
  # starts key with nf_ (for nutrition information)
  # is value wether 0 or nil
  def is_valid_pair key, value
    return true unless value.nil? || value == 0 || !key.include?('nf_')
  end
end