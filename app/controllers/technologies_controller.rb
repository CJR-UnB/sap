class TechnologiesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_technology, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @technologies = Technology.all
  end

  def show
  end

  def new
    respond_modal_with @technology = Technology.new
  end

  def edit
  end

  def create
    @technology = Technology.new(technology_params)

    respond_to do |format|
      if @technology.save
        format.html { redirect_to technologies_path, notice: 'A tecnologia foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @technology }
      else
        format.html { render :new }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @technology.update(technology_params)
        format.html { redirect_to technologies_path, notice: 'A tecnologia foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @technology }
      else
        format.html { render :edit }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @technology.destroy
    respond_to do |format|
      format.html { redirect_to technologies_url, notice: 'A tecnologia foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_technology
      @technology = Technology.find(params[:id])
    end

    def technology_params
      params.require(:technology).permit(:name, :description)
    end

    def modal_responder
      respond_modal_with set_technology
    end

end