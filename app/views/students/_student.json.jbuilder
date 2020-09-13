json.extract! student, :id, :name, :phone_number, :address, :major_id, :is_deleted, :created_at, :updated_at
json.url student_url(student, format: :json)
