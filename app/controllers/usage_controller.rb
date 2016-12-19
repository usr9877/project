class UsageController < ApplicationController
	skip_before_filter :check_logined
  before_filter :check_user_logined
  def index
    @m = "/usage"
  	@bookrents = Bookrent.where(user_id: system_user.id).where.not(status:3)
  end
end
