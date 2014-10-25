class Admin::Student < ActiveRecord::Base
  belongs_to :category,class_name:"Admin::Category"
  belongs_to :user,class_name:"Admin::User"
  belongs_to :course ,class_name:"Admin::Course"
end
