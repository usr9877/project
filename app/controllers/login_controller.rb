class LoginController < ApplicationController
  def index
  	@admin = Admin.new
  	cookies[:login] = nil
    @user_type==0
  end

  def create
    admin = Admin.authenticate(params[:admin][:email], params[:admin][:password])
    if admin
      cookies[:login] = admin.id
      redirect_to "/admins"
    else
      flash.alert = "Invalid email or password"
      redirect_to "/login"
    end
  end
  
  def destroy
    cookies[:login] = nil
    redirect_to "/login"
  end

end
