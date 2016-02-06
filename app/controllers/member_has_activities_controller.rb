class MemberHasActivitiesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_member_has_activity, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @member_has_activities = MemberHasActivity.all
  end

  def show
  end

  def new
    respond_modal_with @member_has_activity = MemberHasActivity.new
  end

  def edit
  end

  def create
    @member_has_activity = MemberHasActivity.new(member_has_activity_params)

    respond_to do |format|
      if @member_has_activity.save
        format.html { redirect_to member_has_activities_path, notice: 'A atividade do membro foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @member_has_activity }
      else
        format.html { render :new }
        format.json { render json: @member_has_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member_has_activity.update(member_has_activity_params)
        format.html { redirect_to member_has_activities_path, notice: 'A atividade do membro foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @member_has_activity }
      else
        format.html { render :edit }
        format.json { render json: @member_has_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member_has_activity.destroy
    respond_to do |format|
      format.html { redirect_to member_has_activities_url, notice: 'A atividade do membro foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_member_has_activity
      @member_has_activity = MemberHasActivity.find(params[:id])
    end

    def member_has_activity_params
      params.require(:member_has_activity).permit(:member_id, :activity_id)
    end

    def modal_responder
      respond_modal_with set_member_has_activity
    end

end