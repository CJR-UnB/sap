class ActivitiesController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @activities = Activity.all.includes(:activity_type)
  end

  def show
  end

  def new
    respond_modal_with @activity = Activity.new
  end

  def edit
  end

  def associar
    @associacao = ActivitiesMember.new(activity_id: @activity.id, member_id: current_member.id)

    respond_to do |format|
      if @associacao.save
        format.html { redirect_to :back, notice: 'A associação foi criada com sucesso!' }
      end
    end

  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activities_path, notice: 'A atividade foi criada com sucesso!' }
        format.json { render :index, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activities_path, notice: 'A atividade foi atualizada com sucesso!' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'A atividade foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:description, :credit_numbers, :activity_type_id)
    end

    def modal_responder
      respond_modal_with set_activity
    end

end