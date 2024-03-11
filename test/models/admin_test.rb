require "test_helper"

class AdminTest < ActiveSupport::TestCase
  test "Admin attributes must be present" do
    admin = Admin.new

    assert admin.invalid?
    assert admin.errors[:email].any?
  end
end
