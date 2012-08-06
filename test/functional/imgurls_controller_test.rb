require 'test_helper'

class ImgurlsControllerTest < ActionController::TestCase
  setup do
    @imgurl = imgurls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imgurls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imgurl" do
    assert_difference('Imgurl.count') do
      post :create, imgurl: { url: @imgurl.url }
    end

    assert_redirected_to imgurl_path(assigns(:imgurl))
  end

  test "should show imgurl" do
    get :show, id: @imgurl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imgurl
    assert_response :success
  end

  test "should update imgurl" do
    put :update, id: @imgurl, imgurl: { url: @imgurl.url }
    assert_redirected_to imgurl_path(assigns(:imgurl))
  end

  test "should destroy imgurl" do
    assert_difference('Imgurl.count', -1) do
      delete :destroy, id: @imgurl
    end

    assert_redirected_to imgurls_path
  end
end
