class ProjectMemberHistoriesController < ApplicationController
  before_action :set_project_member_history, only: [:show, :edit, :update, :destroy]

  # GET /project_member_histories
  # GET /project_member_histories.json
  def index
    @project_member_histories = ProjectMemberHistory.all
  end

  # GET /project_member_histories/1
  # GET /project_member_histories/1.json
  def show
  end

  # GET /project_member_histories/new
  def new
    @project_member_history = ProjectMemberHistory.new
  end

  # GET /project_member_histories/1/edit
  def edit
  end

  # POST /project_member_histories
  # POST /project_member_histories.json
  def create
    @project_member_history = ProjectMemberHistory.new(project_member_history_params)

    respond_to do |format|
      if @project_member_history.save
        format.html { redirect_to @project_member_history, notice: 'Project member history was successfully created.' }
        format.json { render :show, status: :created, location: @project_member_history }
      else
        format.html { render :new }
        format.json { render json: @project_member_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_member_histories/1
  # PATCH/PUT /project_member_histories/1.json
  def update
    respond_to do |format|
      if @project_member_history.update(project_member_history_params)
        format.html { redirect_to @project_member_history, notice: 'Project member history was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_member_history }
      else
        format.html { render :edit }
        format.json { render json: @project_member_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_member_histories/1
  # DELETE /project_member_histories/1.json
  def destroy
    @project_member_history.destroy
    respond_to do |format|
      format.html { redirect_to project_member_histories_url, notice: 'Project member history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_member_history
      @project_member_history = ProjectMemberHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_member_history_params
      params.require(:project_member_history).permit(:observation, :member_id, :project_id, :project_role_id)
    end
end
