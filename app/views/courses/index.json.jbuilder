json.array! @courses do |course|
  json.id course.id
  json.title course.title
  json.description course.description
  json.start_date course.start_date
  json.end_date course.end_date
  json.tutors course.tutors do |tutor|
    json.id tutor.id
    json.name tutor.name
    json.email tutor.email
  end
end
