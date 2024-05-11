json.extract! course, :id, :title, :description, :start_date, :end_date, :created_at, :updated_at
json.tutors do
  json.array! course.tutors do |tutor|
    json.extract! tutor, :id, :name, :email, :created_at, :updated_at
  end
end
