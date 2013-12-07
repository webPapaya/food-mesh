require_dependency 'food_apis/fddb'
require_dependency 'food_apis/fsecret'

module FoodApisModule
  @@apis = [Fddb.new];

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
      result += api.search query
    end
    result
  end
end