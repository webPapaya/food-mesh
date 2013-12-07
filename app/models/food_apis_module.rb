require_dependency 'food_apis/fddb'
require_dependency 'food_apis/fsecret'

module FoodApisModule
  @@apis = [Fsecret.new];

  def search_apis query
    result = ""

    @@apis.each do |api|
      result += api.search query
    end
    result
  end
end