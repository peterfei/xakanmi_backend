class Admin::User < User
	
 accepts_nested_attributes_for :user_roles, allow_destroy: true
  	def to_s
  		self.name
  	end
end
