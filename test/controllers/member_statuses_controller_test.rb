require 'test_helper'

class MemberStatusesControllerTest < ActionController::TestCase
  setup do
    @member_status = member_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_status" do
    assert_difference('MemberStatus.count') do
      post :create, member_status: { description: @member_status.description }
    end

    assert_redirected_to member_status_path(assigns(:member_status))
  end

  test "should show member_status" do
    get :show, id: @member_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_status
    assert_response :success
  end

  test "should update member_status" do
    patch :update, id: @member_status, member_status: { description: @member_status.description }
    assert_redirected_to member_status_path(assigns(:member_status))
  end

  test "should destroy member_status" do
    assert_difference('MemberStatus.count', -1) do
      delete :destroy, id: @member_status
    end

    assert_redirected_to member_statuses_path
  end
end
