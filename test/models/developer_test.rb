require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  
  def setup
    @developer = Developer.new(developername: "sohaib", email: "sohaib@example.com")
  end
  
  test "developer should be valid" do
  assert @developer.valid?
  end
  
  test "developername should be present" do
  @developer.developername = " "
  assert_not @developer.valid?
  end
  
  test "developername should not be too long" do
  @developer.developername = "a" * 41
  assert_not @developer.valid?
  end
  
  test "developername should not be too short" do
  @developer.developername = "aa"
  assert_not @developer.valid?
  end
  
  test "email should be present" do
  @developer.email = " "
  assert_not @developer.valid?
  end
  
  test "email length should be within bounds" do
  @developer.email = "a" * 101 + "@example.com"
  assert_not @developer.valid?
  end
  
  test "email address should be unique" do
  dup_developer = @developer.dup
  dup_developer.email = @developer.email.upcase
  @developer.save
  assert_not dup_developer.valid?
  end
  
  test "email validation should accept valid addresses" do
  valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user2example.com first.last@eem.au sohaib+ali@monk.cm]
  valid_addresses.each do |va|
    @developer.email = va
    assert @developer.valid?, '#{va.inspect} should be valid'
  end
end
  
  test "email validation should reject invalid addresses" do
  invalid_addresses = %w[user@example,com user_at_eee.org user.name@example.eee@i_am_.com foo@ee+aar.com]
  invalid_addresses.each do |ia|
   @developer.email = ia
   assert_not @developer.valid?, '#{ia.inspect} should be invalid'
  end
end
