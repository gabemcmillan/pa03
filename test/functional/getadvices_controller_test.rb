require 'test_helper'

class GetadvicesControllerTest < ActionController::TestCase
  setup do
    @getadvice = getadvices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:getadvices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create getadvice" do
    assert_difference('Getadvice.count') do
      post :create, getadvice: {  }
    end

    assert_redirected_to getadvice_path(assigns(:getadvice))
  end

  test "should show getadvice" do
    get :show, id: @getadvice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @getadvice
    assert_response :success
  end

  test "should update getadvice" do
    put :update, id: @getadvice, getadvice: {  }
    assert_redirected_to getadvice_path(assigns(:getadvice))
  end

  test "should destroy getadvice" do
    assert_difference('Getadvice.count', -1) do
      delete :destroy, id: @getadvice
    end

    assert_redirected_to getadvices_path
  end
end
