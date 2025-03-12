# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @attrs = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
  end

  test 'should get show' do
    get task_url @task
    assert_response :success
  end

  test 'should post create' do
    post tasks_url params: { task: @attrs }
    follow_redirect!

    found_task = Task.where(name: @attrs[:name])
    assert_not_empty found_task, 'Task should be found'
  end

  test 'should patch update' do
    patch task_url(@task), params: { task: @attrs }
    assert_redirected_to task_url(@task)

    @task.reload

    assert { @task.name == @attrs[:name] }
  end

  test 'should delete destroy' do
    delete task_url @task

    assert_redirected_to tasks_url

    assert { !Task.exists? @task.id }
  end
end
