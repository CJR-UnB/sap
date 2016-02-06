class MemberHasProjectsController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_member_has_project, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @member_has_projects = MemberHasProject.all
  end

  def show
  end

  def new
    respond_modal_with @member_has_project = MemberHasProject.new
  end

  def edit
  end

  def create
    @member_has_project = MemberHasProject.new(member_has_project_params)

    respond_to do |format|
      if @member_has_project.save
        format.html { redirect_to member_has_projects_path, notice: 'O projeto do membro foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @member_has_project }
      else
        format.html { render :new }
        format.json { render json: @member_has_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member_has_project.update(member_has_project_params)
        format.html { redirect_to member_has_projects_path, notice: 'O projeto do membro foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @member_has_project }
      else
        format.html { render :edit }
        format.json { render json: @member_has_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member_has_project.destroy
    respond_to do |format|
      format.html { redirect_to member_has_projects_url, notice: 'O projeto do membro foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_member_has_project
      @member_has_project = MemberHasProject.find(params[:id])
    end

    def member_has_project_params
      params.require(:member_has_project).permit(:member_id, :project_id, :project_role_id)
    end

    def modal_responder
      respond_modal_with set_member_has_project
    end

end