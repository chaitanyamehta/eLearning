json.extract! purchase, :id, :student_id, :section_id, :price, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
