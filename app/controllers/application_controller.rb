class ApplicationController < ActionController::Base
  skip_before_filter :check_logined
  skip_before_filter :check_user_logined
  helper_method        :current_user
  helper_method        :system_user

  
  private
  def system_user
    @system_user ||= User.find_by_id(cookies[:user]) if cookies[:user]
  end
  def check_user_logined
    if cookies[:user] && User.find_by_id(cookies[:user])
      begin
        @avatar  = User.find_by_id(cookies[:user])
        @user_type = 1
      rescue ActiveRecord::RecordNotFound
        flash[:errors] = "Хэрэглэгчийн мэдээлэл олдсонгүй."
        reset_session
      end
    end

    unless @avatar
      flash[:referer] = request.fullpath
      respond_to do |format|
        format.html {redirect_to "/sign_in"}
      end
    end
  end

  def current_user
    @current_user ||= Admin.find_by_id(cookies[:login]) if cookies[:login]
  end
  def check_logined
    if cookies[:login] && Admin.find_by_id(cookies[:login])
      begin
        @vtr  = Admin.find_by_id(cookies[:login])
        
      rescue ActiveRecord::RecordNotFound
        flash[:errors] = "Хэрэглэгчийн мэдээлэл олдсонгүй."
        reset_session
      end
    end

    unless @vtr
      flash[:referer] = request.fullpath
      respond_to do |format|
        format.html {redirect_to "/login"}
      end
    end
  end
end
