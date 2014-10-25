class Admin::User < User
	
 accepts_nested_attributes_for :user_roles, allow_destroy: true
end
