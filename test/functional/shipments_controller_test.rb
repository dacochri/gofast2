require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post :create, shipment: { broker_id: @shipment.broker_id, cartage: @shipment.cartage, customer_id: @shipment.customer_id, delivery_time: @shipment.delivery_time, distance: @shipment.distance, driver_id: @shipment.driver_id, partial: @shipment.partial, pickup_time: @shipment.pickup_time, rate: @shipment.rate, shipment_no: @shipment.shipment_no, skid_count: @shipment.skid_count, trip_id: @shipment.trip_id }
    end

    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should show shipment" do
    get :show, id: @shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipment
    assert_response :success
  end

  test "should update shipment" do
    put :update, id: @shipment, shipment: { broker_id: @shipment.broker_id, cartage: @shipment.cartage, customer_id: @shipment.customer_id, delivery_time: @shipment.delivery_time, distance: @shipment.distance, driver_id: @shipment.driver_id, partial: @shipment.partial, pickup_time: @shipment.pickup_time, rate: @shipment.rate, shipment_no: @shipment.shipment_no, skid_count: @shipment.skid_count, trip_id: @shipment.trip_id }
    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete :destroy, id: @shipment
    end

    assert_redirected_to shipments_path
  end
end
