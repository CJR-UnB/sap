class ActivitiesController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all
  end

  def show
    respond_modal_with @activity
  end

  def new
    @activity = Activity.new
    respond_modal_with @activity
  end

  def edit
    respond_modal_with @activity
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        flash[:notice] = 'A atividade foi criada com sucesso!'
        format.js { render inline: "location.reload();" }
      else
        flash[:danger] = 'Algo deu errado!'
        format.js { render inline: "location.reload();" }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        flash[:notice] = 'A atividade foi atualizada com sucesso!'
        format.js { render inline: "location.reload();" }
      else
        flash[:danger] = 'Algo deu errado!'
        format.js { render inline: "location.reload();" }
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

end