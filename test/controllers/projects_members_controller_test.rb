require 'test_helper'

class ProjectsMembersControllerTest < ActionController::TestCase
  setup do
    @projects_member = projects_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projects_member" do
    assert_difference('ProjectsMember.count') do
      post :create, projects_member: { member_id: @projects_member.member_id, project_id: @projects_member.project_id }
    end

    assert_redirected_to projects_member_path(assigns(:projects_member))
  end

  test "should show projects_member" do
    get :show, id: @projects_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projects_member
    assert_response :success
  end

  test "should update projects_member" do
    patch :update, id: @projects_member, projects_member: { member_id: @projects_member.member_id, project_id: @projects_member.project_id }
    assert_redirected_to projects_member_path(assigns(:projects_member))
  end

  test "should destroy projects_member" do
    assert_difference('ProjectsMember.count', -1) do
      delete :destroy, id: @projects_member
    end

    assert_redirected_to projects_members_path
  end
end
