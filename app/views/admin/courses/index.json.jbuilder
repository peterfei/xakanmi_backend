json.array!(@admin_courses) do |admin_course|
  json.extract! admin_course, :id, :name, :category_id, :status, :startdate, :cid
  json.url admin_course_url(admin_course, format: :json)
end
