require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "test_user", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name= ""
    assert_not @user.valid?
  end

  test "name should be unique" do
    duplicate_user = @user.dup
    duplicate_user.name = @user.name
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
    @user.password_digest = ""
    assert_not @user.valid?
  end

  test "associated todos should be destroyed" do
    @user.save
    @user.todos.create!(title: "test todo", description: "Lorem Ipsum", status: "todo")
    assert_difference 'Todo.count', -1 do
      @user.destroy
    end
  end
end
