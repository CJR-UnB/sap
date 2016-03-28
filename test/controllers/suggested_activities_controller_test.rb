require 'test_helper'

class SuggestedActivitiesControllerTest < ActionController::TestCase
  setup do
    @suggested_activity = suggested_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suggested_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suggested_activity" do
    assert_difference('SuggestedActivity.count') do
      post :create, suggested_activity: { activity: @suggested_activity.activity, activity_type_id: @suggested_activity.activity_type_id, member_id: @suggested_activity.member_id, request_status_id: @suggested_activity.request_status_id }
    end

    assert_redirected_to suggested_activity_path(assigns(:suggested_activity))
  end

  test "should show suggested_activity" do
    get :show, id: @suggested_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suggested_activity
    assert_response :success
  end

  test "should update suggested_activity" do
    patch :update, id: @suggested_activity, suggested_activity: { activity: @suggested_activity.activity, activity_type_id: @suggested_activity.activity_type_id, member_id: @suggested_activity.member_id, request_status_id: @suggested_activity.request_status_id }
    assert_redirected_to suggested_activity_path(assigns(:suggested_activity))
  end

  test "should destroy suggested_activity" do
    assert_difference('SuggestedActivity.count', -1) do
      delete :destroy, id: @suggested_activity
    end

    assert_redirected_to suggested_activities_path
  end
end
