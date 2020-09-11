json.extract! course, :id, :course_number, :name, :discipline_id, :area, :price, :is_deleted, :created_at, :updated_at
json.url course_url(course, format: :json)
