class MembersProjectsController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_members_project, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @members_projects = MembersProject.all
  end

  def show
  end

  def new
    respond_modal_with @members_project = MembersProject.new
  end

  def edit
  end

  def create
    @members_project = MembersProject.new(members_project_params)

    respond_to do |format|
      if @members_project.save

        @historico = ProjectMemberHistory.new(member_id: @members_project.member.id, project_id: @members_project.project.id, project_role_id: @members_project.project_role.id, observation:'Membro alocado em ' + Time.now.to_s)

        if @historico.save
          format.html { redirect_to :back, notice: 'O membro foi alocado com sucesso!' }
          format.json { render :show, status: :created, location: @members_project }
        end

      else
        format.html { render :new }
        format.json { render json: @members_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @members_project.update(members_project_params)
        format.html { redirect_to :back, notice: 'A alocação foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @members_project }
      else
        format.html { render :edit }
        format.json { render json: @members_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|

      @historico = ProjectMemberHistory.new(member_id: @members_project.member.id, project_id: @members_project.project.id, project_role_id: @members_project.project_role.id, observation:'Membro desalocado em ' + Time.now.to_s)

      if @members_project.destroy
        @historico.save
        format.html { redirect_to :back, notice: 'O membro foi desalocado com sucesso!' }
        format.json { head :no_content }
      end

    end
  end

  private

    def set_members_project
      @members_project = MembersProject.find(params[:id])
    end

    def members_project_params
      params.require(:members_project).permit(:member_id, :project_id, :project_role_id)
    end

    def modal_responder
      respond_modal_with set_members_project
    end

end