require 'food_apis/fsecret'
require 'food_apis/fddb'

include 'Fsecret'
include 'Fddb'

class FoodAPIs
  def initialize
     @apis = [Fddb.new, Fsecret.new]
  end

  def search(query)
    rtn = ""
    @apis.each do |api|
      rtn += api.search query
    end
    rtn
  end
end