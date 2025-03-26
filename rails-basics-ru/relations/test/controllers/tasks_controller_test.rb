require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_index_url
    puts "THIS IS BODY #{@response.errors}" if response.status == 500 # 👈
    assert_response :success
  end
end
