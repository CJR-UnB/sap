require 'test_helper'

class ActivitiesMembersControllerTest < ActionController::TestCase
  setup do
    @activities_member = activities_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activities_member" do
    assert_difference('ActivitiesMember.count') do
      post :create, activities_member: { activity_id: @activities_member.activity_id, member_id: @activities_member.member_id }
    end

    assert_redirected_to activities_member_path(assigns(:activities_member))
  end

  test "should show activities_member" do
    get :show, id: @activities_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activities_member
    assert_response :success
  end

  test "should update activities_member" do
    patch :update, id: @activities_member, activities_member: { activity_id: @activities_member.activity_id, member_id: @activities_member.member_id }
    assert_redirected_to activities_member_path(assigns(:activities_member))
  end

  test "should destroy activities_member" do
    assert_difference('ActivitiesMember.count', -1) do
      delete :destroy, id: @activities_member
    end

    assert_redirected_to activities_members_path
  end
end
