require_dependency 'food_apis/food_api_interface'

require 'fatsecret'
require 'awesome_print'



class Fsecret < FoodAPIInterface
  def initialize
    FatSecret.init('e2310b092c9f4acbb43657f59c242245', '3d0cc9b6114741bbbfe6c2510e8913c3')
  end

  def search(api_key, query)
    data = FatSecret.search_food(query)
    data = nil unless (data['foods']['total_results'].to_i > 0)
    (parse_data_search(data, api_key)) unless data.nil?
  end

  def get_item(api_key, id)
    data = FatSecret.food(id)

    #data = nil unless (!data['error'].nil?)

    (parse_data_item(data, api_key)) unless data.nil?
  end

  ##
  # todo calculate nutritions per 100g
  #

  private
  def create_item_header_information(item, api_key)
    ap item

    create_food_item_structure({
      :name => item['food_name'],
      :api_key => api_key,
      :item_id => item['food_id'],
      :object_source_id => self.object_id,
      :serving_weight => {
          :unit => 'g',
          :value => item['_source']['nf_serving_weight_grams']
      }
    })
  end

  def parse_data_item (data, api_key)
    item = data['food']

    food = create_item_header_information item, api_key

    item['servings']['serving'].each do |key, ingredient|
      key = translate_key key, :fatsecret
      food[:nutritions][key] = ingredient
    end

    [food]
  end

  def parse_data_search(data, api_key)
    parsed_data = []
    data["foods"]["food"].each do |item|
      food = create_item_header_information item, api_key
      tmp = item['food_description'].split(' - ')
      food[:amount] = tmp[0]

      ingredients = tmp[1].split(' | ')
      ingredients.each do |ingredient|
        tmp = ingredient.split(": ")
        key = translate_key tmp[0], :fatsecret
        food[:nutritions][key] = tmp[1]
      end
      parsed_data.push(food)
    end

    parsed_data
  end
end