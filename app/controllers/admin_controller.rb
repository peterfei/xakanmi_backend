class AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :cancan_hack
  layout 'admin'
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  load_and_authorize_resource
  # before_filter :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|  
	# flash[:error] = "Access denied!"
	gflash :error => '您未授权在该模块，请联系系统管理员'  
	redirect_to :back  
  end  
  protect_from_forgery with: :exception
  include Admin::SessionsHelper

end
