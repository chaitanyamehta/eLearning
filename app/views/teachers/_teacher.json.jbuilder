json.extract! teacher, :id, :name, :phone_number, :address, :is_deleted, :discipline_id, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
