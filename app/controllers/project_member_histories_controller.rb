class ProjectMemberHistoriesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_project_member_history, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @project_member_histories = ProjectMemberHistory.all
  end

  def show
  end

  def new
    respond_modal_with @project_member_history = ProjectMemberHistory.new
  end

  def edit
  end

  def create
    @project_member_history = ProjectMemberHistory.new(project_member_history_params)

    respond_to do |format|
      if @project_member_history.save
        format.html { redirect_to project_member_histories_path, notice: 'O histórico de projeto do membro foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @project_member_history }
      else
        format.html { render :new }
        format.json { render json: @project_member_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_member_history.update(project_member_history_params)
        format.html { redirect_to project_member_histories_path, notice: 'O histórico de projeto do membro foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @project_member_history }
      else
        format.html { render :edit }
        format.json { render json: @project_member_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_member_history.destroy
    respond_to do |format|
      format.html { redirect_to project_member_histories_url, notice: 'O histórico de projeto do membro foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_project_member_history
      @project_member_history = ProjectMemberHistory.find(params[:id])
    end

    def project_member_history_params
      params.require(:project_member_history).permit(:observation, :member_id, :project_id, :project_role_id)
    end

    def modal_responder
      respond_modal_with set_project_member_history
    end

end