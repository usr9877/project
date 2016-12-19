class UsersController < ApplicationController
  before_filter :check_logined
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @m = "/users"
    @users    = (params[:search].blank?) ? User.all.page(params[:page]).per(20) : User.all.params[:search].page(params[:page]).per(20)
    @user     = User.new
    @last_cod = (User.all.blank?) ? 100000 : User.all.order("kod").last.kod.to_i+1
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @m = "/users"
  end

  # GET /users/new
  def new
    @m = "/users"
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @m = "/users"
  end

  def create
    @obj = User.new(user_params)
    @obj.save
    redirect_to URI.escape("/users")
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:kod, :firstname, :lastname, :email, :rd, :phone, :phone_home, :password, :password_confirmation)
    end
end
