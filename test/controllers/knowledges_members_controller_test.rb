require 'test_helper'

class KnowledgesMembersControllerTest < ActionController::TestCase
  setup do
    @knowledges_member = knowledges_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledges_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledges_member" do
    assert_difference('KnowledgesMember.count') do
      post :create, knowledges_member: { knowledge_id: @knowledges_member.knowledge_id, member_id: @knowledges_member.member_id }
    end

    assert_redirected_to knowledges_member_path(assigns(:knowledges_member))
  end

  test "should show knowledges_member" do
    get :show, id: @knowledges_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledges_member
    assert_response :success
  end

  test "should update knowledges_member" do
    patch :update, id: @knowledges_member, knowledges_member: { knowledge_id: @knowledges_member.knowledge_id, member_id: @knowledges_member.member_id }
    assert_redirected_to knowledges_member_path(assigns(:knowledges_member))
  end

  test "should destroy knowledges_member" do
    assert_difference('KnowledgesMember.count', -1) do
      delete :destroy, id: @knowledges_member
    end

    assert_redirected_to knowledges_members_path
  end
end
