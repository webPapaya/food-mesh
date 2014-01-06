##
# food_api_interface.rb
#
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	    Multimediaprojekt 2a (MMP2a)
# author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
#              - Franziska Oberhauser

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