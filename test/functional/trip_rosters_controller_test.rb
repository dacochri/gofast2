require 'test_helper'

class TripRostersControllerTest < ActionController::TestCase
  setup do
    @trip_roster = trip_rosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_rosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_roster" do
    assert_difference('TripRoster.count') do
      post :create, trip_roster: { shipment_id: @trip_roster.shipment_id, trip_id: @trip_roster.trip_id }
    end

    assert_redirected_to trip_roster_path(assigns(:trip_roster))
  end

  test "should show trip_roster" do
    get :show, id: @trip_roster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip_roster
    assert_response :success
  end

  test "should update trip_roster" do
    put :update, id: @trip_roster, trip_roster: { shipment_id: @trip_roster.shipment_id, trip_id: @trip_roster.trip_id }
    assert_redirected_to trip_roster_path(assigns(:trip_roster))
  end

  test "should destroy trip_roster" do
    assert_difference('TripRoster.count', -1) do
      delete :destroy, id: @trip_roster
    end

    assert_redirected_to trip_rosters_path
  end
end
