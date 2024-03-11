require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def current_user
    @current_user
  end

  setup do
    get '/users/sign_in'
    @current_user = users(:one)
    sign_in @current_user
    post user_session_url

    @booking = bookings(:one)
    @current_user.bookings = [@booking]
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url, params: { booking: { animal_name: @booking.animal_name, animal_type: @booking.animal_type, date_of_service: @booking.date_of_service, first_name: @booking.first_name, hours_requested: @booking.hours_requested, last_name: @booking.last_name } }
    end

    assert_redirected_to booking_url(Booking.last)
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { animal_name: @booking.animal_name, animal_type: @booking.animal_type, date_of_service: @booking.date_of_service, first_name: @booking.first_name, hours_requested: @booking.hours_requested, last_name: @booking.last_name } }
    assert_redirected_to booking_url(@booking)
  end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to bookings_url
  end
end
