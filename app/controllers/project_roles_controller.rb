class ProjectRolesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_project_role, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @project_roles = ProjectRole.all
  end

  def show
  end

  def new
    respond_modal_with @project_role = ProjectRole.new
  end

  def edit
  end

  def create
    @project_role = ProjectRole.new(project_role_params)

    respond_to do |format|
      if @project_role.save
        format.html { redirect_to project_roles_path, notice: 'A função de projeto foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @project_role }
      else
        format.html { render :new }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_role.update(project_role_params)
        format.html { redirect_to project_roles_path, notice: 'A função de projeto foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @project_role }
      else
        format.html { render :edit }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_role.destroy
    respond_to do |format|
      format.html { redirect_to project_roles_url, notice: 'A função de projeto foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_project_role
      @project_role = ProjectRole.find(params[:id])
    end

    def project_role_params
      params.require(:project_role).permit(:description)
    end

    def modal_responder
      respond_modal_with set_project_role
    end

end