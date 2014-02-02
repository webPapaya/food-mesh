require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase
    test "the truth" do
        assert true, "hallo"
    end

    it "food item exist" do
        test = FoodItem.get_local_item('0-51c3610a97c3e69de4b02784')
        FoodItem.get_local_item('apple')
        FoodItem.get_local_item('beer')
        app test
        test.must_equal 'Salad Golden Grain'
    end
end
