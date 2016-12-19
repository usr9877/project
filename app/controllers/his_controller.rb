class HisController < ApplicationController
  
  def user
    @m = "/his/user"
    @ids  = UserRepeatLogin.pluck(:user_id)
    @data = User.where(id: @ids).page(params[:page]).per(20)
  end
  
  def book
    @m = "/his/book"
    @ids  = Bookrent.all.pluck(:book_id)
    @data = Book.where(id: @ids).page(params[:page]).per(20)
  end
  
  def history
    @m = "/his/history"
    @bookrents = Bookrent.all.order("created_at DESC").page(params[:page]).per(20)
  end

  def history_book
    @m = "/his/history_book"
  	if params[:user_id].to_i>0
  	 	@bookrents = Bookrent.where(user_Id: params[:user_id].to_i).order("created_at DESC").page(params[:page]).per(20)
  	 else
  	 		@bookrents =  Bookrent.all.order("created_at DESC").page(params[:page]).per(20)
  	end
  	@types= Array.new

  	@types.push(value: "Хүсэлт тодорхойгүй", id:0)
  	@types.push(value: "Хүсэлт илгээгдсэн", id:1)
  	@types.push(value: "Гэрээр олгогдсон", id:2)
  	@types.push(value: "Буцаан өгсөн", id:3)
  end

  def change_type
    Bookrent.find(params[:trip][:id]).update(status:params[:trip][:status]).page(params[:page]).per(20)
    redirect_to URI.escape("/his/history_book")
  end
  
end
