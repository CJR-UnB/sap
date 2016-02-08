class ActivitiesMembersController < ApplicationController
  before_action :set_activities_member, only: [:show, :edit, :update, :destroy]

  # GET /activities_members
  # GET /activities_members.json
  def index
    @activities_members = ActivitiesMember.all
  end

  # GET /activities_members/1
  # GET /activities_members/1.json
  def show
  end

  # GET /activities_members/new
  def new
    @activities_member = ActivitiesMember.new
  end

  # GET /activities_members/1/edit
  def edit
  end

  # POST /activities_members
  # POST /activities_members.json
  def create
    @activities_member = ActivitiesMember.new(activities_member_params)

    respond_to do |format|
      if @activities_member.save
        format.html { redirect_to @activities_member, notice: 'Activities member was successfully created.' }
        format.json { render :show, status: :created, location: @activities_member }
      else
        format.html { render :new }
        format.json { render json: @activities_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities_members/1
  # PATCH/PUT /activities_members/1.json
  def update
    respond_to do |format|
      if @activities_member.update(activities_member_params)
        format.html { redirect_to @activities_member, notice: 'Activities member was successfully updated.' }
        format.json { render :show, status: :ok, location: @activities_member }
      else
        format.html { render :edit }
        format.json { render json: @activities_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities_members/1
  # DELETE /activities_members/1.json
  def destroy
    @activities_member.destroy
    respond_to do |format|
      format.html { redirect_to activities_members_url, notice: 'Activities member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activities_member
      @activities_member = ActivitiesMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activities_member_params
      params.require(:activities_member).permit(:member_id, :activity_id)
    end
end
