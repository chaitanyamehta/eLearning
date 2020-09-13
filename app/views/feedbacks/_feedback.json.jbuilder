json.extract! feedback, :id, :description, :section_id, :student_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
