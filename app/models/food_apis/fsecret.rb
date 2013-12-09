require 'fatsecret'
require_dependency 'food_apis/food_apis_helper'

I18n.locale = :fatsecret
I18n.enforce_available_locales = false

class Fsecret
  def initialize
    FatSecret.init('e2310b092c9f4acbb43657f59c242245', '3d0cc9b6114741bbbfe6c2510e8913c3')
  end

  def search query
    parse_data(FatSecret.search_food(query))
  end

  ##
  # todo calculate nutritions per 100g
  #

  private
  include FoodAPIsHelper

  def parse_data data
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
        food["nutritions"][t(tmp[0])] = tmp[1]
      end
      parsed_data.push(food)
    end

    parsed_data
  end
<<<<<<< HEAD

  def t key
    puts key
    key.downcase!
    I18n.t(key)
  end
=======
>>>>>>> c568eaffb4a299639823e4c36a127618a9a6f1c4
end