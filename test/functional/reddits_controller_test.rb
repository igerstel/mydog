require 'test_helper'

class RedditsControllerTest < ActionController::TestCase
  setup do
    @reddit = reddits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reddits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reddit" do
    assert_difference('Reddit.count') do
      post :create, reddit: { url: @reddit.url }
    end

    assert_redirected_to reddit_path(assigns(:reddit))
  end

  test "should show reddit" do
    get :show, id: @reddit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reddit
    assert_response :success
  end

  test "should update reddit" do
    put :update, id: @reddit, reddit: { url: @reddit.url }
    assert_redirected_to reddit_path(assigns(:reddit))
  end

  test "should destroy reddit" do
    assert_difference('Reddit.count', -1) do
      delete :destroy, id: @reddit
    end

    assert_redirected_to reddits_path
  end
end
