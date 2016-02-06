class ProjectStatusesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_project_status, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @project_statuses = ProjectStatus.all
  end

  def show
  end

  def new
    respond_modal_with @project_status = ProjectStatus.new
  end

  def edit
  end

  def create
    @project_status = ProjectStatus.new(project_status_params)

    respond_to do |format|
      if @project_status.save
        format.html { redirect_to project_statuses_path, notice: 'O status de projeto foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @project_status }
      else
        format.html { render :new }
        format.json { render json: @project_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_status.update(project_status_params)
        format.html { redirect_to project_statuses_path, notice: 'O status de projeto foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @project_status }
      else
        format.html { render :edit }
        format.json { render json: @project_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_status.destroy
    respond_to do |format|
      format.html { redirect_to project_statuses_url, notice: 'O status de projeto foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_project_status
      @project_status = ProjectStatus.find(params[:id])
    end

    def project_status_params
      params.require(:project_status).permit(:description)
    end

    def modal_responder
      respond_modal_with set_project_status
    end

end