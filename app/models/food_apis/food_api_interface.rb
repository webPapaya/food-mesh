require_dependency 'food_apis/food_apis_helper'

class FoodAPIInterface
  include FoodAPIsHelper
  def search (api_key, query)
    raise NotImplementedError, "search is not implemented"
  end

  def get_item (id)
    raise NotImplementedError, "get_item is not implemented"
  end
end