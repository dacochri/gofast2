require 'test_helper'

class SkidsControllerTest < ActionController::TestCase
  setup do
    @skid = skids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skid" do
    assert_difference('Skid.count') do
      post :create, skid: { company_id: @skid.company_id, delivery_location: @skid.delivery_location, delivery_time: @skid.delivery_time, oversized: @skid.oversized, pickup_location: @skid.pickup_location, pickup_time: @skid.pickup_time, product_desc: @skid.product_desc, shipment_id: @skid.shipment_id, skid_count: @skid.skid_count, warehouse_delivery_time: @skid.warehouse_delivery_time, warehouse_pickup_time: @skid.warehouse_pickup_time, weight: @skid.weight }
    end

    assert_redirected_to skid_path(assigns(:skid))
  end

  test "should show skid" do
    get :show, id: @skid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skid
    assert_response :success
  end

  test "should update skid" do
    put :update, id: @skid, skid: { company_id: @skid.company_id, delivery_location: @skid.delivery_location, delivery_time: @skid.delivery_time, oversized: @skid.oversized, pickup_location: @skid.pickup_location, pickup_time: @skid.pickup_time, product_desc: @skid.product_desc, shipment_id: @skid.shipment_id, skid_count: @skid.skid_count, warehouse_delivery_time: @skid.warehouse_delivery_time, warehouse_pickup_time: @skid.warehouse_pickup_time, weight: @skid.weight }
    assert_redirected_to skid_path(assigns(:skid))
  end

  test "should destroy skid" do
    assert_difference('Skid.count', -1) do
      delete :destroy, id: @skid
    end

    assert_redirected_to skids_path
  end
end
