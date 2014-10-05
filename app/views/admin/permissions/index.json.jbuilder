json.array!(@admin_permissions) do |admin_permission|
  json.extract! admin_permission, :id, :code, :subject, :action
  json.url admin_permission_url(admin_permission, format: :json)
end
