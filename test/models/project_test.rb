require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    @developer = Developer.create(developername: "sohaib", email: "sohaib@example.com")
    @project = @developer.projects.build(name: "Project idea", summary: "This is a great project", description: "Use Rails local/Cloud IDE, Github, Heroku cloud server, Bootstrap for designing")
  end

test "project should be valid" do
  assert @project.valid?
end

test "developer_id should be present" do
  @project.developer_id = nil
  assert_not @project.valid?
end

test "name should be present" do
@project.name = ""
assert_not @project.valid?
end

test "name length should not be too long" do
@project.name = "a" * 101
assert_not @project.valid?
end

test "name should not be too short" do
@project.name = "aaa"
assert_not @project.valid?
end

test "summary should be present" do
@project.summary = " "
assert_not @project.valid?
end

test "summary length should not be too long" do
@project.summary = "a" * 151
assert_not @project.valid?
end

test "summary length should not be too short" do
@project.summary = "a" * 9
assert_not @project.valid?
end

test "description must be present" do
@project.description = " "
assert_not @project.valid?
end

test "description should not be too long" do
@project.description = "a" * 501
assert_not @project.valid?
end

test "description should not be too short" do
@project.description = "a" * 19
assert_not @project.valid?
end

end