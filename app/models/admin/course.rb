class Admin::Course < ActiveRecord::Base
  belongs_to :category
end
