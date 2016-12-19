class SignInController < ApplicationController
	def index
  	@user = User.new
  	cookies[:user] = nil
  	@user_type==0
  end

  def create
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      cookies[:user] = user.id
      UserRepeatLogin.create(user_id: user.id)
      redirect_to "/usage"
    else
      flash.alert = "Invalid email or password"
      redirect_to "/sign_in"
    end
  end
  
  def destroy
    cookies[:user] = nil
    redirect_to "/sign_in"
  end
end
