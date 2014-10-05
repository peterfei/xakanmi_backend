class Admin::Role < ActiveRecord::Base
  has_many :user_roles,class_name:"Admin::UserRole"
  has_many :users, through: :user_roles,class_name:"User"
  # 如果权限字段变化了，则更新关联的用户的权限
  after_save :update_user_permissions, if: -> { changed.include?('permissions') }

  def grant(new_permissions)
    permissions_text = (new_permissions || []).sort.join(',')
    unless permissions == permissions_text
      Admin::Role.transaction do 
        self.update!(permissions: permissions_text)
        self.users.each { |user| user.grant_permissions }
      end
    end
  end

  

  def granted?(permission)
    self.permissions.split(',').include?(permission) 
  end


  def permissions

      read_attribute(:permissions) or ''
  end

  private

	  def update_user_permissions
	    users.each { |user| user.grant_permissions }
	  end

end
