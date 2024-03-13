class AddPricingToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :pricing, :float
  end
end
