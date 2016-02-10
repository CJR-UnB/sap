class ProjectsController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @projects = Project.all.order(:id).includes(:project_status)
    @projetos_nao_iniciados = Project.where(project_status_id: ProjectStatus.find_by(description:'Não iniciado').id).includes(:project_status)
    @projetos_em_desenvolvimento = Project.where(project_status_id: ProjectStatus.find_by(description:'Em desenvolvimento').id).includes(:project_status)
    @projetos_atrasados = Project.where(project_status_id: ProjectStatus.find_by(description:'Atrasado').id).includes(:project_status)
    @projetos_concluidos = Project.where(project_status_id: ProjectStatus.find_by(description:'Concluído').id).includes(:project_status)
  end

  def show
  end

  def new
    respond_modal_with @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to :back, notice: 'O projeto foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to :back, notice: 'O projeto foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'O projeto foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:description, :price, :git, :heroku, :start_date, :end_date, :project_status_id)
    end

    def modal_responder
      respond_modal_with set_project
    end

end