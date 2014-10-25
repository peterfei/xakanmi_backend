json.array!(@admin_students) do |admin_student|
  json.extract! admin_student, :id, :snum, :major, :category_id, :sex, :user_id, :course_id
  json.url admin_student_url(admin_student, format: :json)
end
