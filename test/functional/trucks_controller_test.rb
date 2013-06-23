require 'test_helper'

class TrucksControllerTest < ActionController::TestCase
  setup do
    @truck = trucks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trucks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truck" do
    assert_difference('Truck.count') do
      post :create, truck: { last_safety_id: @truck.last_safety_id, last_service_id: @truck.last_service_id, license_expires: @truck.license_expires, license_plate: @truck.license_plate, make: @truck.make, manufactured_year: @truck.manufactured_year, model: @truck.model, next_safety_date: @truck.next_safety_date, next_service_kilometres: @truck.next_service_kilometres, owned: @truck.owned, total_kilometres: @truck.total_kilometres, truck_no: @truck.truck_no, type: @truck.type, vin_number: @truck.vin_number }
    end

    assert_redirected_to truck_path(assigns(:truck))
  end

  test "should show truck" do
    get :show, id: @truck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truck
    assert_response :success
  end

  test "should update truck" do
    put :update, id: @truck, truck: { last_safety_id: @truck.last_safety_id, last_service_id: @truck.last_service_id, license_expires: @truck.license_expires, license_plate: @truck.license_plate, make: @truck.make, manufactured_year: @truck.manufactured_year, model: @truck.model, next_safety_date: @truck.next_safety_date, next_service_kilometres: @truck.next_service_kilometres, owned: @truck.owned, total_kilometres: @truck.total_kilometres, truck_no: @truck.truck_no, type: @truck.type, vin_number: @truck.vin_number }
    assert_redirected_to truck_path(assigns(:truck))
  end

  test "should destroy truck" do
    assert_difference('Truck.count', -1) do
      delete :destroy, id: @truck
    end

    assert_redirected_to trucks_path
  end
end
