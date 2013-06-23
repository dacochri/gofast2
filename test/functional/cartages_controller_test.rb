require 'test_helper'

class CartagesControllerTest < ActionController::TestCase
  setup do
    @cartage = cartages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cartages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cartage" do
    assert_difference('Cartage.count') do
      post :create, cartage: { company_id: @cartage.company_id, cost: @cartage.cost, delivery_time: @cartage.delivery_time, driver_name: @cartage.driver_name, pickup_time: @cartage.pickup_time, shipment_id: @cartage.shipment_id, trailer_id: @cartage.trailer_id }
    end

    assert_redirected_to cartage_path(assigns(:cartage))
  end

  test "should show cartage" do
    get :show, id: @cartage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cartage
    assert_response :success
  end

  test "should update cartage" do
    put :update, id: @cartage, cartage: { company_id: @cartage.company_id, cost: @cartage.cost, delivery_time: @cartage.delivery_time, driver_name: @cartage.driver_name, pickup_time: @cartage.pickup_time, shipment_id: @cartage.shipment_id, trailer_id: @cartage.trailer_id }
    assert_redirected_to cartage_path(assigns(:cartage))
  end

  test "should destroy cartage" do
    assert_difference('Cartage.count', -1) do
      delete :destroy, id: @cartage
    end

    assert_redirected_to cartages_path
  end
end
