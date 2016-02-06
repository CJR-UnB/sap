class SectorsController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_sector, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @sectors = Sector.all
  end

  def show
  end

  def new
    respond_modal_with @sector = Sector.new
  end

  def edit
  end

  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to sectors_path, notice: 'O núcleo foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to sectors_path, notice: 'O núcleo foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectors_url, notice: 'O núcleo foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_sector
      @sector = Sector.find(params[:id])
    end

    def sector_params
      params.require(:sector).permit(:short_name, :name, :description)
    end

    def modal_responder
      respond_modal_with set_sector
    end

end
