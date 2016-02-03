class ActivityTypesController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_activity_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @activity_types = ActivityType.all
  end

  def show
    respond_modal_with @activity_type
  end

  def new
    @activity_type = ActivityType.new
    respond_modal_with @activity_type
  end

  def edit
    respond_modal_with @activity_type
  end

  def create
    @activity_type = ActivityType.new(activity_type_params)

    respond_to do |format|
      if @activity_type.save
        format.html { redirect_to activity_types_path, notice: 'O tipo de atividade foi criado com sucesso!' }
        format.json { render :index, status: :created, location: @activity_type }
      else
        format.html { render :new }
        format.json { render json: @activity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity_type.update(activity_type_params)
        format.html { redirect_to activity_types_path, notice: 'O tipo de atividade foi atualizado com sucesso!' }
        format.json { render :show, status: :created, location: @activity_type }
      else
        format.html { render :edit }
        format.json { render json: @activity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity_type.destroy
    respond_to do |format|
      format.html { redirect_to activity_types_url, notice: 'O tipo de atividade foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_activity_type
      @activity_type = ActivityType.find(params[:id])
    end

    def activity_type_params
      params.require(:activity_type).permit(:description)
    end

end