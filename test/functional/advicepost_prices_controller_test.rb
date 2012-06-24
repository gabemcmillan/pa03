require 'test_helper'

class AdvicepostPricesControllerTest < ActionController::TestCase
  setup do
    @advicepost_price = advicepost_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:advicepost_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advicepost_price" do
    assert_difference('AdvicepostPrice.count') do
      post :create, advicepost_price: { price: @advicepost_price.price }
    end

    assert_redirected_to advicepost_price_path(assigns(:advicepost_price))
  end

  test "should show advicepost_price" do
    get :show, id: @advicepost_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @advicepost_price
    assert_response :success
  end

  test "should update advicepost_price" do
    put :update, id: @advicepost_price, advicepost_price: { price: @advicepost_price.price }
    assert_redirected_to advicepost_price_path(assigns(:advicepost_price))
  end

  test "should destroy advicepost_price" do
    assert_difference('AdvicepostPrice.count', -1) do
      delete :destroy, id: @advicepost_price
    end

    assert_redirected_to advicepost_prices_path
  end
end
