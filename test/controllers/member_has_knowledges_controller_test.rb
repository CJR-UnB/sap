require 'test_helper'

class MemberHasKnowledgesControllerTest < ActionController::TestCase
  setup do
    @member_has_knowledge = member_has_knowledges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_has_knowledges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_has_knowledge" do
    assert_difference('MemberHasKnowledge.count') do
      post :create, member_has_knowledge: { knowledge_id: @member_has_knowledge.knowledge_id, member_id: @member_has_knowledge.member_id }
    end

    assert_redirected_to member_has_knowledge_path(assigns(:member_has_knowledge))
  end

  test "should show member_has_knowledge" do
    get :show, id: @member_has_knowledge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_has_knowledge
    assert_response :success
  end

  test "should update member_has_knowledge" do
    patch :update, id: @member_has_knowledge, member_has_knowledge: { knowledge_id: @member_has_knowledge.knowledge_id, member_id: @member_has_knowledge.member_id }
    assert_redirected_to member_has_knowledge_path(assigns(:member_has_knowledge))
  end

  test "should destroy member_has_knowledge" do
    assert_difference('MemberHasKnowledge.count', -1) do
      delete :destroy, id: @member_has_knowledge
    end

    assert_redirected_to member_has_knowledges_path
  end
end
