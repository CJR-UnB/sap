class MemberHasActivitiesController < ApplicationController
  before_action :set_member_has_activity, only: [:show, :edit, :update, :destroy]

  # GET /member_has_activities
  # GET /member_has_activities.json
  def index
    @member_has_activities = MemberHasActivity.all
  end

  # GET /member_has_activities/1
  # GET /member_has_activities/1.json
  def show
  end

  # GET /member_has_activities/new
  def new
    @member_has_activity = MemberHasActivity.new
  end

  # GET /member_has_activities/1/edit
  def edit
  end

  # POST /member_has_activities
  # POST /member_has_activities.json
  def create
    @member_has_activity = MemberHasActivity.new(member_has_activity_params)

    respond_to do |format|
      if @member_has_activity.save
        format.html { redirect_to @member_has_activity, notice: 'Member has activity was successfully created.' }
        format.json { render :show, status: :created, location: @member_has_activity }
      else
        format.html { render :new }
        format.json { render json: @member_has_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_has_activities/1
  # PATCH/PUT /member_has_activities/1.json
  def update
    respond_to do |format|
      if @member_has_activity.update(member_has_activity_params)
        format.html { redirect_to @member_has_activity, notice: 'Member has activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_has_activity }
      else
        format.html { render :edit }
        format.json { render json: @member_has_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_has_activities/1
  # DELETE /member_has_activities/1.json
  def destroy
    @member_has_activity.destroy
    respond_to do |format|
      format.html { redirect_to member_has_activities_url, notice: 'Member has activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_has_activity
      @member_has_activity = MemberHasActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_has_activity_params
      params.require(:member_has_activity).permit(:member_id, :activity_id)
    end
end
