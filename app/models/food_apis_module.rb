require_dependency 'food_apis/fddb'
require_dependency 'food_apis/fsecret'
require 'awesome_print'

module FoodApisModule
  @@apis = [Fddb.new, Fsecret.new]

  ##
  # example return value for search
  #  [{
  #      "name"=>"Tilapia (Fish)",
  #      "amount"=>"Per 100g",
  #      "nutritions"=>{
  #          "Calories"=>"96kcal",
  #          "Fat"=>"1.70g",
  #          "Carbs"=>"0.00g",
  #          "Protein"=>"20.08g"
  #      }
  #  }]

  def search_apis query
    result = ""
    @@apis.each do |api|
      ap api.search query
      result += "--------------------------------------------------------------"
    end
    result
  end
end