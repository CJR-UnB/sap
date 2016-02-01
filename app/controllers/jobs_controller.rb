class JobsController < ApplicationController

  respond_to :html, :json
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
    respond_modal_with @job
  end

  def new
    @job = Job.new
    respond_modal_with @job
  end

  def edit
    respond_modal_with @job
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        flash[:notice] = 'O cargo foi criado com sucesso!'
        format.js { render inline: "location.reload();" }
      else
        flash[:danger] = 'Algo deu errado!'
        format.js { render inline: "location.reload();" }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        flash[:notice] = 'O cargo foi atualizado com sucesso!'
        format.js { render inline: "location.reload();" }
      else
        flash[:danger] = 'Algo deu errado!'
        format.js { render inline: "location.reload();" }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'O cargo foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:description)
    end
    
end