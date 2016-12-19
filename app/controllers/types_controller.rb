class TypesController < ApplicationController
  before_filter :check_logined
  before_action :set_type, only: [:show, :edit, :destroy]

  # GET /types
  # GET /types.json
  def index
    @m = "/types"
    @types = Type.all
    @type = Type.new
  end

  # GET /types/1
  # GET /types/1.json
  def show
    @m = "/types"
  end

  # GET /types/new
  def new
    @m = "/types"
    @type = Type.new
  end

  # GET /types/1/edit
  def edit
    @m = "/types"
  end

  def create
    @obj = Type.new(type_params)
    if !@obj.save
      @obj = Type.all.page(params[:page]).per(20)
    end
    redirect_to URI.escape("/types")
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    Type.find(params[:type][:id]).update(title: params[:type][:title])
    redirect_to URI.escape("/types")
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type.destroy
    respond_to do |format|
      format.html { redirect_to types_url, notice: 'Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_params
      params.require(:type).permit(:title)
    end
end
