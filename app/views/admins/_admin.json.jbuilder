json.extract! admin, :id, :name, :phone_number, :address, :is_deleted, :created_at, :updated_at
json.url admin_url(admin, format: :json)
