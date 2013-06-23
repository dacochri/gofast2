require 'test_helper'

class TrailersControllerTest < ActionController::TestCase
  setup do
    @trailer = trailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trailer" do
    assert_difference('Trailer.count') do
      post :create, trailer: { last_safety_id: @trailer.last_safety_id, last_service_id: @trailer.last_service_id, license_plate: @trailer.license_plate, make: @trailer.make, manufactured_year: @trailer.manufactured_year, model: @trailer.model, next_safety_date: @trailer.next_safety_date, next_service_date: @trailer.next_service_date, trailer_no: @trailer.trailer_no, type: @trailer.type, vin_number: @trailer.vin_number }
    end

    assert_redirected_to trailer_path(assigns(:trailer))
  end

  test "should show trailer" do
    get :show, id: @trailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trailer
    assert_response :success
  end

  test "should update trailer" do
    put :update, id: @trailer, trailer: { last_safety_id: @trailer.last_safety_id, last_service_id: @trailer.last_service_id, license_plate: @trailer.license_plate, make: @trailer.make, manufactured_year: @trailer.manufactured_year, model: @trailer.model, next_safety_date: @trailer.next_safety_date, next_service_date: @trailer.next_service_date, trailer_no: @trailer.trailer_no, type: @trailer.type, vin_number: @trailer.vin_number }
    assert_redirected_to trailer_path(assigns(:trailer))
  end

  test "should destroy trailer" do
    assert_difference('Trailer.count', -1) do
      delete :destroy, id: @trailer
    end

    assert_redirected_to trailers_path
  end
end
