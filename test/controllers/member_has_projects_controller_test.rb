require 'test_helper'

class MemberHasProjectsControllerTest < ActionController::TestCase
  setup do
    @member_has_project = member_has_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_has_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_has_project" do
    assert_difference('MemberHasProject.count') do
      post :create, member_has_project: { member_id: @member_has_project.member_id, project_id: @member_has_project.project_id, project_role_id: @member_has_project.project_role_id }
    end

    assert_redirected_to member_has_project_path(assigns(:member_has_project))
  end

  test "should show member_has_project" do
    get :show, id: @member_has_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_has_project
    assert_response :success
  end

  test "should update member_has_project" do
    patch :update, id: @member_has_project, member_has_project: { member_id: @member_has_project.member_id, project_id: @member_has_project.project_id, project_role_id: @member_has_project.project_role_id }
    assert_redirected_to member_has_project_path(assigns(:member_has_project))
  end

  test "should destroy member_has_project" do
    assert_difference('MemberHasProject.count', -1) do
      delete :destroy, id: @member_has_project
    end

    assert_redirected_to member_has_projects_path
  end
end
