require 'test_helper'

class LineChartsControllerTest < ActionController::TestCase
  setup do
    @line_chart = line_charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_chart" do
    assert_difference('LineChart.count') do
      post :create, line_chart: {  }
    end

    assert_redirected_to line_chart_path(assigns(:line_chart))
  end

  test "should show line_chart" do
    get :show, id: @line_chart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_chart
    assert_response :success
  end

  test "should update line_chart" do
    patch :update, id: @line_chart, line_chart: {  }
    assert_redirected_to line_chart_path(assigns(:line_chart))
  end

  test "should destroy line_chart" do
    assert_difference('LineChart.count', -1) do
      delete :destroy, id: @line_chart
    end

    assert_redirected_to line_charts_path
  end
end
