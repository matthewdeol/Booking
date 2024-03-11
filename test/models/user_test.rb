require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user attributes must be present" do
    user = User.new

    assert user.invalid?
    assert user.errors[:email].any?
  end
end
