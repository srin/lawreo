require 'test_helper'

class AnswercommentsControllerTest < ActionController::TestCase
  setup do
    @answercomment = answercomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answercomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answercomment" do
    assert_difference('Answercomment.count') do
      post :create, answercomment: { answer_id: @answercomment.answer_id, body: @answercomment.body, user_id: @answercomment.user_id }
    end

    assert_redirected_to answercomment_path(assigns(:answercomment))
  end

  test "should show answercomment" do
    get :show, id: @answercomment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answercomment
    assert_response :success
  end

  test "should update answercomment" do
    patch :update, id: @answercomment, answercomment: { answer_id: @answercomment.answer_id, body: @answercomment.body, user_id: @answercomment.user_id }
    assert_redirected_to answercomment_path(assigns(:answercomment))
  end

  test "should destroy answercomment" do
    assert_difference('Answercomment.count', -1) do
      delete :destroy, id: @answercomment
    end

    assert_redirected_to answercomments_path
  end
end
