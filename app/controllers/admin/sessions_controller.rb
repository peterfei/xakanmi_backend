class Admin::SessionsController < ApplicationController
  layout 'signinout'
  skip_before_filter :verify_authenticity_token  
  # skip_authorize_resource 
  skip_before_filter :require_no_authentication 
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      gflash :now,:success => '登陆成功'
      redirect_to admin_courses_path(course:'active')
    else
      gflash :error => '错误的用户名或密码'
      # flash.now[:error] = '错误的用户名或密码'
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to signin_path
  end

end
