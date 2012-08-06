require 'test_helper'

class FbooksControllerTest < ActionController::TestCase
  setup do
    @fbook = fbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fbook" do
    assert_difference('Fbook.count') do
      post :create, fbook: { access: @fbook.access, url: @fbook.url }
    end

    assert_redirected_to fbook_path(assigns(:fbook))
  end

  test "should show fbook" do
    get :show, id: @fbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fbook
    assert_response :success
  end

  test "should update fbook" do
    put :update, id: @fbook, fbook: { access: @fbook.access, url: @fbook.url }
    assert_redirected_to fbook_path(assigns(:fbook))
  end

  test "should destroy fbook" do
    assert_difference('Fbook.count', -1) do
      delete :destroy, id: @fbook
    end

    assert_redirected_to fbooks_path
  end
end
