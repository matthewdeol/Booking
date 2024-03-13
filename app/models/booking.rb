class Booking < ApplicationRecord
    validates :first_name, :last_name, :animal_name, :animal_type, :hours_requested, :date_of_service, presence: true
    validates :hours_requested, numericality: { greater_than_or_equal_to: 2.0, less_than_or_equal_to: 8.0 }
    enum :animal_type, { dog: 0, cat: 1 }

    before_validation :set_pricing

    belongs_to :user

    private

    def animal_fee
        dog? ? 10 : 5
    end

    def set_pricing
        self.pricing = (20 + (self.hours_requested * self.animal_fee))
    end
end
