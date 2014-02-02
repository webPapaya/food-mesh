require 'test_helper'

class FoodItemControllerTest < ActionController::TestCase
  test 'should get show' do
    get :show, :item_id => '0-513fceb475b8dbbc21000fd4', :locale => 'en'
    assert_response :success
  end

  test 'should get search' do
    get :search, :query => 'banana', :locale => 'en'
    assert_response :success
  end
end
