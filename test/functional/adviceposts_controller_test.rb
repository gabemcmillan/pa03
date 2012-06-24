require 'test_helper'

class AdvicepostsControllerTest < ActionController::TestCase
  setup do
    @advicepost = adviceposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adviceposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advicepost" do
    assert_difference('Advicepost.count') do
      post :create, advicepost: { category_id: @advicepost.category_id, categoryname: @advicepost.categoryname, miniresume: @advicepost.miniresume, user_id: @advicepost.user_id }
    end

    assert_redirected_to advicepost_path(assigns(:advicepost))
  end

  test "should show advicepost" do
    get :show, id: @advicepost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @advicepost
    assert_response :success
  end

  test "should update advicepost" do
    put :update, id: @advicepost, advicepost: { category_id: @advicepost.category_id, categoryname: @advicepost.categoryname, miniresume: @advicepost.miniresume, user_id: @advicepost.user_id }
    assert_redirected_to advicepost_path(assigns(:advicepost))
  end

  test "should destroy advicepost" do
    assert_difference('Advicepost.count', -1) do
      delete :destroy, id: @advicepost
    end

    assert_redirected_to adviceposts_path
  end
end
