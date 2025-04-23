require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = post_comments(:one)
  end

  test "should get index" do
    get post_comments_url(@post), headers: json_headers
    assert_response :success
  end

  test "should get new" do
    get new_post_comment_url(@post), headers: json_headers
    assert_response :success
  end

  test "should show comment" do
    get post_comment_url(@post, @comment), headers: json_headers
    assert_response :success
  end

  test "should get edit" do
    get edit_post_comment_url(@post, @comment), headers: json_headers
    assert_response :success
  end
  private

  def json_headers
    {
      "Accept" => "application/json",
      "Content-Type" => "application/json"
    }
  end
end