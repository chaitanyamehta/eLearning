json.extract! credit_card, :id, :name_on_card, :card_number, :expiration_date, :cvv, :student_id, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
