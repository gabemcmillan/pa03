require 'test_helper'

class GiveadvicesControllerTest < ActionController::TestCase
  setup do
    @giveadvice = giveadvices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:giveadvices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create giveadvice" do
    assert_difference('Giveadvice.count') do
      post :create, giveadvice: {  }
    end

    assert_redirected_to giveadvice_path(assigns(:giveadvice))
  end

  test "should show giveadvice" do
    get :show, id: @giveadvice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @giveadvice
    assert_response :success
  end

  test "should update giveadvice" do
    put :update, id: @giveadvice, giveadvice: {  }
    assert_redirected_to giveadvice_path(assigns(:giveadvice))
  end

  test "should destroy giveadvice" do
    assert_difference('Giveadvice.count', -1) do
      delete :destroy, id: @giveadvice
    end

    assert_redirected_to giveadvices_path
  end
end
