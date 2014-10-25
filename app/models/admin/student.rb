class Admin::Student < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :course
end
