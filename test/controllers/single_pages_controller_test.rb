class SinglePagesControllerTest < ActionController::TestCase
  setup do
    @single_page = single_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:single_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create single_page" do
    assert_difference('SinglePage.count') do
      post :create, single_page: {  }
    end

    assert_redirected_to single_page_path(assigns(:single_page))
  end

  test "should show single_page" do
    get :show, id: @single_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @single_page
    assert_response :success
  end

  test "should update single_page" do
    patch :update, id: @single_page, single_page: {  }
    assert_redirected_to single_page_path(assigns(:single_page))
  end

  test "should destroy single_page" do
    assert_difference('SinglePage.count', -1) do
      delete :destroy, id: @single_page
    end

    assert_redirected_to single_pages_path
  end
end
