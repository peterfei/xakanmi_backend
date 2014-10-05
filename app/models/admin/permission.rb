class Admin::Permission < ActiveRecord::Base
  before_save :make_permission_code

  private
  def make_permission_code
    self.code = "#{subject}-#{action}"
  end

end
