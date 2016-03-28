class SuggestedActivitiesController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_suggested_activity, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @suggested_activities = SuggestedActivity.all
  end

  def show
  end

  def new
    respond_modal_with @suggested_activity = SuggestedActivity.new
  end

  def edit
  end

  def create
    @suggested_activity = SuggestedActivity.new(suggested_activity_params)

    @suggested_activity.member_id = current_member.id
    @suggested_activity.request_status_id = RequestStatus.where(description: 'Em análise').try(:first).try(:id)

    respond_to do |format|
      if @suggested_activity.save
        format.html { redirect_to :back, notice: 'A sugestão de atividade foi feita com sucesso!' }
        format.json { render :show, status: :created, location: @suggested_activity }
      else
        format.html { render :new }
        format.json { render json: @suggested_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def aprovar
    @suggested_activity.update(request_status_id, RequestStatus.where(description: 'Deferido').try(:first).try(:id))

    @atividade = Activity.new(description: @suggested_activity.activity, activity_type_id: @suggested_activity.activity_type_id, credit_numbers: @suggested_activity.credit_numbers) 
  
    respond_to do |format|
      if @atividade.save
        format.html { redirect_to :back, notice:'A sugestão de atividade foi aceita!' }
      end
    end
  end

  def recusar
    respond_to do |format|
      if @suggested_activity.update(request_status_id, RequestStatus.where(description: 'Indeferido').try(:first).try(:id))
        format.html { redirect_to :back, notice:'A sugestão de atividade foi recusada!' }
      end
    end
  end

  def update
    respond_to do |format|
      if @suggested_activity.update(suggested_activity_params)
        format.html { redirect_to :back, notice: 'A sugestão de atividade foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @suggested_activity }
      else
        format.html { render :edit }
        format.json { render json: @suggested_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @suggested_activity.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'A sugestão de atividade foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_suggested_activity
      @suggested_activity = SuggestedActivity.find(params[:id])
    end

    def suggested_activity_params
      params.require(:suggested_activity).permit(:activity, :activity_type_id, :member_id, :request_status_id, :credit_numbers)
    end

    def modal_responder
      respond_modal_with set_suggested_activity
    end

end