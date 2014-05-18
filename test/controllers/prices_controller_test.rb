require 'test_helper'

class PricesControllerTest < ActionController::TestCase
  setup do
    @price = prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price" do
    assert_difference('Price.count') do
      post :create, price: { d_air_v_cost: @price.d_air_v_cost, d_air_w_cost: @price.d_air_w_cost, d_land_v_cost: @price.d_land_v_cost, d_land_w_cost: @price.d_land_w_cost, i_air_v_cost: @price.i_air_v_cost, i_air_w_cost: @price.i_air_w_cost, i_land_v_cost: @price.i_land_v_cost, i_land_w_cost: @price.i_land_w_cost }
    end

    assert_redirected_to price_path(assigns(:price))
  end

  test "should show price" do
    get :show, id: @price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price
    assert_response :success
  end

  test "should update price" do
    patch :update, id: @price, price: { d_air_v_cost: @price.d_air_v_cost, d_air_w_cost: @price.d_air_w_cost, d_land_v_cost: @price.d_land_v_cost, d_land_w_cost: @price.d_land_w_cost, i_air_v_cost: @price.i_air_v_cost, i_air_w_cost: @price.i_air_w_cost, i_land_v_cost: @price.i_land_v_cost, i_land_w_cost: @price.i_land_w_cost }
    assert_redirected_to price_path(assigns(:price))
  end

  test "should destroy price" do
    assert_difference('Price.count', -1) do
      delete :destroy, id: @price
    end

    assert_redirected_to prices_path
  end
end
