class User < ActiveRecord::Base
  # validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  # before_create :create_remember_token
  before_save { self.email = email.downcase }
  has_many :user_roles,class_name:"Admin::UserRole"
  has_many :roles, through: :user_roles,class_name:"Admin::Role"
  accepts_nested_attributes_for :user_roles, allow_destroy: true
  after_save :grant_permissions
  
  def admin?
    email == 'admin@admin.com'
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  #FIXME 有误
  # def User.hash(token)
  #   Digest::SHA1.hexdigest(token.to_s)
  # end
  def grant_permissions
    logger.info "Granting user permission after user changed..."
    permissions = roles.map { |role| role.permissions.split(',') }.flatten.uniq.join(',')
    logger.info "Permission to grant: #{permissions}"
    update_column(:permissions, permissions)
  end
private

  # def create_remember_token
  #   # Create the token.
  
	 # self.remember_token = User.hash(User.new_remember_token)
  # end

  

end
