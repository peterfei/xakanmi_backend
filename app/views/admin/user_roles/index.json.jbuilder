json.array!(@admin_user_roles) do |admin_user_role|
  json.extract! admin_user_role, :id, :user_id, :role_id
  json.url admin_user_role_url(admin_user_role, format: :json)
end
