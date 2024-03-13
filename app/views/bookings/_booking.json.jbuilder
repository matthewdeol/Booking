json.extract! booking, :id, :first_name, :last_name, :animal_name, :animal_type, :hours_requested, :date_of_service, :created_at, :updated_at, :pricing
json.url booking_url(booking, format: :json)
