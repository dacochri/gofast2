require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post :create, driver: { business_name: @driver.business_name, cell_phone: @driver.cell_phone, city: @driver.city, comments: @driver.comments, first_name: @driver.first_name, home_phone: @driver.home_phone, hst_no: @driver.hst_no, last_name: @driver.last_name, postal_code: @driver.postal_code, street: @driver.street, trailer_id: @driver.trailer_id, truck_id: @driver.truck_id, unit: @driver.unit }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should show driver" do
    get :show, id: @driver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver
    assert_response :success
  end

  test "should update driver" do
    put :update, id: @driver, driver: { business_name: @driver.business_name, cell_phone: @driver.cell_phone, city: @driver.city, comments: @driver.comments, first_name: @driver.first_name, home_phone: @driver.home_phone, hst_no: @driver.hst_no, last_name: @driver.last_name, postal_code: @driver.postal_code, street: @driver.street, trailer_id: @driver.trailer_id, truck_id: @driver.truck_id, unit: @driver.unit }
    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete :destroy, id: @driver
    end

    assert_redirected_to drivers_path
  end
end
