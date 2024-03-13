require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "booking attributes must be present" do
    booking = Booking.new

    assert booking.invalid?
    assert booking.errors[:first_name].any?
    assert booking.errors[:last_name].any? 
    assert booking.errors[:hours_requested].any? 
    assert booking.errors[:animal_type].any?
  end

  test "booking hours_requested must be greater than 2.0" do
    booking = bookings(:one)

    assert booking.valid?

    booking.hours_requested = 1

    assert booking.invalid?
    assert_equal ["must be greater than or equal to 2.0"], booking.errors[:hours_requested]
  end

  test "booking price for animal is 20 + (hours * rate)" do
    booking = Booking.new(
      first_name: "bob",
      last_name: "smith",
      animal_name: "fido",
      hours_requested: 3,
      animal_type: 1,
      date_of_service: "2024-03-08 11:37:13",
      user: users(:one)
    )
    booking.animal_type = :dog
    booking.save!

    assert_equal 50.0, booking.pricing

    booking.animal_type = :cat
    booking.save!

    assert_equal 35.0, booking.pricing
  end
end
