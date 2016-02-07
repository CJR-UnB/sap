class ProjectsMembersController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_projects_member, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @projects_members = ProjectsMember.all
  end

  def show
  end

  def new
    respond_modal_with @projects_member = ProjectsMember.new
  end

  def edit
  end

  def create
    @projects_member = ProjectsMember.new(projects_member_params)

    respond_to do |format|
      if @projects_member.save
        format.html { redirect_to projects_members_path, notice: 'O membro foi alocado com sucesso!' }
        format.json { render :show, status: :created, location: @projects_member }
      else
        format.html { render :new }
        format.json { render json: @projects_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @projects_member.update(projects_member_params)
        format.html { redirect_to projects_members_path, notice: 'A alocação foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @projects_member }
      else
        format.html { render :edit }
        format.json { render json: @projects_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @projects_member.destroy
    respond_to do |format|
      format.html { redirect_to projects_members_url, notice: 'O membro foi desalocado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_projects_member
      @projects_member = ProjectsMember.find(params[:id])
    end

    def projects_member_params
      params.require(:projects_member).permit(:member_id, :project_id)
    end

    def modal_responder
      respond_modal_with set_projects_member
    end

end