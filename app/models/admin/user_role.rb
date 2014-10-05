class Admin::UserRole < ActiveRecord::Base
  belongs_to :role,class_name:"Admin::Role"
  belongs_to :user,class_name:"User"

end
