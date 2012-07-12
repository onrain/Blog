require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
    @update = {
      comment_content: 'Test',
      data_p: Time.now,
      email: 'test@test.ru',
      post_id:'3',
      username: "Bender Rodrigues"
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: @update
    end

    assert_redirected_to comments_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to admins_path
  end
end
