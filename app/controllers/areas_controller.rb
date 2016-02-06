class AreasController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @areas = Area.all.includes(:sector)
  end

  def show
  end

  def new
    respond_modal_with @area = Area.new
  end

  def edit
  end

  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_path, notice: 'A área foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to areas_path, notice: 'A área foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'A área foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_area
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(:name, :sector_id)
    end

    def modal_responder
      respond_modal_with set_area
    end

end