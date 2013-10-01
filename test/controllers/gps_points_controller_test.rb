require 'test_helper'

class GpsPointsControllerTest < ActionController::TestCase
  setup do
    @gps_point = gps_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gps_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gps_point" do
    assert_difference('GpsPoint.count') do
      post :create, gps_point: { latitude: @gps_point.latitude, longitude: @gps_point.longitude }
    end

    assert_redirected_to gps_point_path(assigns(:gps_point))
  end

  test "should show gps_point" do
    get :show, id: @gps_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gps_point
    assert_response :success
  end

  test "should update gps_point" do
    patch :update, id: @gps_point, gps_point: { latitude: @gps_point.latitude, longitude: @gps_point.longitude }
    assert_redirected_to gps_point_path(assigns(:gps_point))
  end

  test "should destroy gps_point" do
    assert_difference('GpsPoint.count', -1) do
      delete :destroy, id: @gps_point
    end

    assert_redirected_to gps_points_path
  end
end
