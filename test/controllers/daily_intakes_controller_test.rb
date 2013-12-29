require 'test_helper'

class DailyIntakesControllerTest < ActionController::TestCase
  setup do
    @daily_intake = daily_intakes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_intakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_intake" do
    assert_difference('DailyIntake.count') do
      post :create, daily_intake: { key: @daily_intake.key, unit: @daily_intake.unit, value: @daily_intake.value }
    end

    assert_redirected_to daily_intake_path(assigns(:daily_intake))
  end

  test "should show daily_intake" do
    get :show, id: @daily_intake
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_intake
    assert_response :success
  end

  test "should update daily_intake" do
    patch :update, id: @daily_intake, daily_intake: { key: @daily_intake.key, unit: @daily_intake.unit, value: @daily_intake.value }
    assert_redirected_to daily_intake_path(assigns(:daily_intake))
  end

  test "should destroy daily_intake" do
    assert_difference('DailyIntake.count', -1) do
      delete :destroy, id: @daily_intake
    end

    assert_redirected_to daily_intakes_path
  end
end
