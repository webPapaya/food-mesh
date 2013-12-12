require_dependency 'food_apis/food_api_interface'
require_dependency 'food_apis/food_apis_helper'
require 'fatsecret'



class Fsecret < FoodAPIInterface
  def initialize
    FatSecret.init('e2310b092c9f4acbb43657f59c242245', '3d0cc9b6114741bbbfe6c2510e8913c3')
  end

  def search query
    data = FatSecret.search_food(query)
    data = nil unless (data['foods']['total_results'].to_i > 0)
    (parse_data_search(data)) unless data.nil?
  end

  def get_item id
    data = FatSecret.food(id)

    puts data

    #data = nil unless (!data['error'].nil?)


    (parse_data_item(data)) unless data.nil?
  end

  ##
  # todo calculate nutritions per 100g
  #

  private
  def parse_data_item data
    item = data['food']

    food = Hash.new
    food['name'] = item['food_name']
    food['object_source_id'] = self.object_id
    food['item_id'] = item['food_id']
    food['nutritions'] = Hash.new

    item['servings']['serving'].each do |key, ingredient|
      key = I18n.t key, locale: :fatsecret
      food['nutritions'][key] = ingredient
    end

    [food]
  end

  def parse_data_search data
    parsed_data = []
    data["foods"]["food"].each do |item|
      tmp = item["food_description"].split(" - ")
      desc = tmp[1]

      food = Hash.new
      food["name"] = item["food_name"]
      food['object_source_id'] = self.object_id
      food["amount"] = tmp[0]
      food["nutritions"] = Hash.new

      ingredients = desc.split(" | ")
      ingredients.each do |ingredient|
        tmp = ingredient.split(": ")
        key = I18n.t tmp[0], locale: :fatsecret
        food["nutritions"][key] = tmp[1]
      end
      parsed_data.push(food)
    end

    parsed_data
  end
end