class AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'admin'
  rescue_from CanCan::AccessDenied do |exception|  
	# flash[:error] = "Access denied!"
	gflash :error => '您未授权在该模块，请联系系统管理员'  
	redirect_to admin_dashboards_url  
  end  
  protect_from_forgery with: :exception
  include Admin::SessionsHelper
end
