class Booking < ApplicationRecord
    validates :first_name, :last_name, :animal_name, :animal_type, :hours_requested, :date_of_service, presence: true
    validates :hours_requested, numericality: { less_than_or_equal_to: 8.0, greater_than_equal_to: 2.0 }
    enum :animal_type, { dog: 0, cat: 1 }

    belongs_to :user

    def price
        (20 + (hours_requested * animal_fee))
    end

    private

    def animal_fee
        dog? ? 10 : 5
    end
end
