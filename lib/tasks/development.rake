namespace :development do
  desc "run some dev taksk"
  task backfill_pricing: :environment do
    bookings = Booking.where(pricing: nil)
    
    bookings.each do |booking|
      booking.update(pricing: (20 + (booking.hours_requested * (booking.dog? ? 10 : 5))))
    end
  end

end
