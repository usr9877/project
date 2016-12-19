class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @m = "/books" 
    @books    = (params[:search].blank?) ? (params[:type].blank?) ? Book.all : Book.where(:type_id=> params[:type]) :  (params[:type].blank?) ? Book.all.params[:search] : Book.where(:type_id=> params[:type]).params[:search] 
    @types    = Type.all
    @book     = Book.new
    @bookrent = Bookrent.new
  end

  def change_type
    redirect_to URI.escape("/books?type=#{params[:trip][:id]}")
  end

  def create_new_book
    @m = "/books"
    if Book.exists?(:kod=> params[:trip][:kod])
      Bookrent.create(book_id: Book.where(:kod=> params[:trip][:kod]).last.id,
                      begin_date: params[:trip][:begin_date],
                      status:1,
                      user_Id: params[:trip][:user_id],
                      end_date:params[:trip][:end_date])
      flash.alert = "Номын захиалга амжилттай илгээгдлээ."
    else
      flash.alert = "Номын код буруу байна."
    end
    redirect_to URI.escape("/books")
  end


  # GET /books/1
  # GET /books/1.json
  def show
    @m = "/books"
  end

  # GET /books/new
  def new
    @m = "/books"
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @m = "/books"
    @types = Type.all
  end

  def create
    @obj = Book.new(book_params)
    @obj.save
    redirect_to URI.escape("/books")
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:kod, :name, :ddc, :count, :isbn, :writer, :write_date, :type_id)
    end
end
