require 'test_helper'

class BasicPagesControllerTest < ActionController::TestCase
  setup do
    @basic_page = basic_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_page" do
    assert_difference('BasicPage.count') do
      post :create, basic_page: { body: @basic_page.body, title: @basic_page.title }
    end

    assert_redirected_to basic_page_path(assigns(:basic_page))
  end

  test "should show basic_page" do
    get :show, id: @basic_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_page
    assert_response :success
  end

  test "should update basic_page" do
    patch :update, id: @basic_page, basic_page: { body: @basic_page.body, title: @basic_page.title }
    assert_redirected_to basic_page_path(assigns(:basic_page))
  end

  test "should destroy basic_page" do
    assert_difference('BasicPage.count', -1) do
      delete :destroy, id: @basic_page
    end

    assert_redirected_to basic_pages_path
  end
end
