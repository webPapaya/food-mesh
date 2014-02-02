require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase
    test "the truth" do
        assert true, "hallo"
    end

    it "food item exist" do
        test = FoodItem.fetch_local_item('0-51c3610a97c3e69de4b02784')
        FoodItem.fetch_local_item('apple')
        FoodItem.fetch_local_item('beer')
        app test
        test.must_equal 'Salad Golden Grain'
    end
end
