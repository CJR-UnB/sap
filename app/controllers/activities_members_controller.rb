class ActivitiesMembersController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_activities_member, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @activities_members = ActivitiesMember.all
  end

  def show
  end

  def new
    respond_modal_with @activities_member = ActivitiesMember.new
  end

  def edit
  end

  def create
    @activities_member = ActivitiesMember.new(activities_member_params)

    respond_to do |format|
      if @activities_member.save
        format.html { redirect_to activities_members_path, notice: 'A atividade foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @activities_member }
      else
        format.html { render :new }
        format.json { render json: @activities_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activities_member.update(activities_member_params)
        format.html { redirect_to activities_members_path, notice: 'A atividade foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @activities_member }
      else
        format.html { render :edit }
        format.json { render json: @activities_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activities_member.destroy
    respond_to do |format|
      format.html { redirect_to activities_members_url, notice: 'A atividade foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_activities_member
      @activities_member = ActivitiesMember.find(params[:id])
    end

    def activities_member_params
      params.require(:activities_member).permit(:member_id, :activity_id)
    end

    def modal_responder
      respond_modal_with set_activities_member
    end

end