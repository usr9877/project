class AdminsController < ApplicationController
  before_filter :check_logined
  skip_before_filter :check_user_logined
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  
  def index
    @m = "/admins" 
    @admins = (params[:search].blank?) ?  Admin.all : Admin.all.page(params[:page]).search(params[:search])
    @admin  = Admin.new
    @last_cod = (Admin.all.blank?) ? 10 : Admin.all.order("kod").last.kod.to_i+1
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @m = "/admins" 
  end


  # GET /admins/new
  def new
    @m = "/admins" 
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    @m = "/admins" 
  end

  def create
    @admin = Admin.new(admin_params)
    if !@admin.save
      @admins = Admin.all.page(params[:page])
    end
    redirect_to URI.escape("/admins")
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_admin
      @admin = Admin.find(params[:id])
    end
    def admin_params
      params.require(:admin).permit(:kod, :firstname, :lastname, :email, :rd, :phone, :phone_home, :password, :password_confirmation)
    end
end
