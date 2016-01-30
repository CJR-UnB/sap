class MemberHasProjectsController < ApplicationController
  before_action :set_member_has_project, only: [:show, :edit, :update, :destroy]

  # GET /member_has_projects
  # GET /member_has_projects.json
  def index
    @member_has_projects = MemberHasProject.all
  end

  # GET /member_has_projects/1
  # GET /member_has_projects/1.json
  def show
  end

  # GET /member_has_projects/new
  def new
    @member_has_project = MemberHasProject.new
  end

  # GET /member_has_projects/1/edit
  def edit
  end

  # POST /member_has_projects
  # POST /member_has_projects.json
  def create
    @member_has_project = MemberHasProject.new(member_has_project_params)

    respond_to do |format|
      if @member_has_project.save
        format.html { redirect_to @member_has_project, notice: 'Member has project was successfully created.' }
        format.json { render :show, status: :created, location: @member_has_project }
      else
        format.html { render :new }
        format.json { render json: @member_has_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_has_projects/1
  # PATCH/PUT /member_has_projects/1.json
  def update
    respond_to do |format|
      if @member_has_project.update(member_has_project_params)
        format.html { redirect_to @member_has_project, notice: 'Member has project was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_has_project }
      else
        format.html { render :edit }
        format.json { render json: @member_has_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_has_projects/1
  # DELETE /member_has_projects/1.json
  def destroy
    @member_has_project.destroy
    respond_to do |format|
      format.html { redirect_to member_has_projects_url, notice: 'Member has project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_has_project
      @member_has_project = MemberHasProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_has_project_params
      params.require(:member_has_project).permit(:member_id, :project_id, :project_role_id)
    end
end
