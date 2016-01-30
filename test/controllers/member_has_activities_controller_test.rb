require 'test_helper'

class MemberHasActivitiesControllerTest < ActionController::TestCase
  setup do
    @member_has_activity = member_has_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_has_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_has_activity" do
    assert_difference('MemberHasActivity.count') do
      post :create, member_has_activity: { activity_id: @member_has_activity.activity_id, member_id: @member_has_activity.member_id }
    end

    assert_redirected_to member_has_activity_path(assigns(:member_has_activity))
  end

  test "should show member_has_activity" do
    get :show, id: @member_has_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_has_activity
    assert_response :success
  end

  test "should update member_has_activity" do
    patch :update, id: @member_has_activity, member_has_activity: { activity_id: @member_has_activity.activity_id, member_id: @member_has_activity.member_id }
    assert_redirected_to member_has_activity_path(assigns(:member_has_activity))
  end

  test "should destroy member_has_activity" do
    assert_difference('MemberHasActivity.count', -1) do
      delete :destroy, id: @member_has_activity
    end

    assert_redirected_to member_has_activities_path
  end
end
