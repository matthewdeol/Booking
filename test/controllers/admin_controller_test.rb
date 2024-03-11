require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/admins/sign_in'
    @current_user = admins(:one)
    sign_in @current_user
    post admin_session_url
  end

  test "should get home" do
    get admin_url
    assert_response :success
  end

  test "should get index" do
    get admin_bookings_url
    assert_response :success
  end
end
