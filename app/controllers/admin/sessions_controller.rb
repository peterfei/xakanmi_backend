class Admin::SessionsController < ApplicationController
  layout 'signinout'
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to admin_dashboards_path
    else
      flash.now[:error] = '错误的用户名或密码'
      render 'new'
    end

  end

  def destroy
  end

end
