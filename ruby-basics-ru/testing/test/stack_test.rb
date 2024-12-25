# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test

  def test_can_add_element
    random_array = Array.new(3) { array.sample }
    added_element = rand(100)
    stack = Stack.new(random_array)
    stack.push!(added_element)
    assert(random_array.count + 1 == stack.size)
    assert(added_element == stack.last)
  end

  def test_can_remove_element
    random_array = Array.new(3) { array.sample }
    stack = Stack.new(random_array)
    stack.pop!
    assert(stack.size == 2)
  end

  def test_can_clear_stack
    random_array = Array.new(3) { array.sample }
    stack = Stack.new(random_array)

    stack.clear!
    assert_empty(stack, "array #{random_array} was not cleared")
  end

  def test_can_be_empty
    random_array = []
    stack = Stack.new(random_array)

    assert(stack.empty?, "array is empty - #{random_array}, but method empty? returns false")
  end
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
