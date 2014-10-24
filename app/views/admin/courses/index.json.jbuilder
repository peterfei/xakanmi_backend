json.array!(@admin_courses) do |admin_course|
  json.extract! admin_course, :id, :name, :category_id, :courseid, :total, :address, :coursedate, :score
  json.url admin_course_url(admin_course, format: :json)
end
