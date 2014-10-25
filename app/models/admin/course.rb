class Admin::Course < ActiveRecord::Base
  belongs_to :category
  has_one :student,class_name:"Admin::Student"
end
