require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def setup
    @todo = Todo.new(title: "some todo", description: "some todo description", status: "done")
  end

  test "title has to be present" do
    @todo.title = ""
    assert_not @todo.valid?
  end

  test "description has to be present" do
    @todo.description = ""
    assert_not @todo.valid?
  end

  test "status has to be present" do
    @todo.status = ""
    assert_not @todo.valid?
  end

  test "status should be done todo or progress only" do
    @todo.status = "some status"
    assert_not @todo.valid?
  end
end