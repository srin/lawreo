require 'test_helper'

class QuestioncommentsControllerTest < ActionController::TestCase
  setup do
    @questioncomment = questioncomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questioncomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questioncomment" do
    assert_difference('Questioncomment.count') do
      post :create, questioncomment: { body: @questioncomment.body, question_id: @questioncomment.question_id, user_id: @questioncomment.user_id }
    end

    assert_redirected_to questioncomment_path(assigns(:questioncomment))
  end

  test "should show questioncomment" do
    get :show, id: @questioncomment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questioncomment
    assert_response :success
  end

  test "should update questioncomment" do
    patch :update, id: @questioncomment, questioncomment: { body: @questioncomment.body, question_id: @questioncomment.question_id, user_id: @questioncomment.user_id }
    assert_redirected_to questioncomment_path(assigns(:questioncomment))
  end

  test "should destroy questioncomment" do
    assert_difference('Questioncomment.count', -1) do
      delete :destroy, id: @questioncomment
    end

    assert_redirected_to questioncomments_path
  end
end
