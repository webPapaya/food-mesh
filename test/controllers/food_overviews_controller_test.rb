require 'test_helper'

class FoodOverviewsControllerTest < ActionController::TestCase
  setup do
    @food_overview = food_overviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_overviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_overview" do
    assert_difference('FoodOverview.count') do
      post :create, food_overview: {  }
    end

    assert_redirected_to food_overview_path(assigns(:food_overview))
  end

  test "should show food_overview" do
    get :show, id: @food_overview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_overview
    assert_response :success
  end

  test "should update food_overview" do
    patch :update, id: @food_overview, food_overview: {  }
    assert_redirected_to food_overview_path(assigns(:food_overview))
  end

  test "should destroy food_overview" do
    assert_difference('FoodOverview.count', -1) do
      delete :destroy, id: @food_overview
    end

    assert_redirected_to food_overviews_path
  end
end
