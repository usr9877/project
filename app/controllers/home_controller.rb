class HomeController < ApplicationController
	skip_before_filter :check_logined
  before_filter :check_user_logined
  def index
  end
end
