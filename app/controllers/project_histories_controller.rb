class ProjectHistoriesController < ApplicationController
  before_action :set_project_history, only: [:show, :edit, :update, :destroy]

  # GET /project_histories
  # GET /project_histories.json
  def index
    @project_histories = ProjectHistory.all
  end

  # GET /project_histories/1
  # GET /project_histories/1.json
  def show
  end

  # GET /project_histories/new
  def new
    @project_history = ProjectHistory.new
  end

  # GET /project_histories/1/edit
  def edit
  end

  # POST /project_histories
  # POST /project_histories.json
  def create
    @project_history = ProjectHistory.new(project_history_params)

    respond_to do |format|
      if @project_history.save
        format.html { redirect_to @project_history, notice: 'Project history was successfully created.' }
        format.json { render :show, status: :created, location: @project_history }
      else
        format.html { render :new }
        format.json { render json: @project_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_histories/1
  # PATCH/PUT /project_histories/1.json
  def update
    respond_to do |format|
      if @project_history.update(project_history_params)
        format.html { redirect_to @project_history, notice: 'Project history was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_history }
      else
        format.html { render :edit }
        format.json { render json: @project_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_histories/1
  # DELETE /project_histories/1.json
  def destroy
    @project_history.destroy
    respond_to do |format|
      format.html { redirect_to project_histories_url, notice: 'Project history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_history
      @project_history = ProjectHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_history_params
      params.require(:project_history).permit(:observation, :project_id)
    end
end
