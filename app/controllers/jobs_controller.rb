class JobsController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    respond_modal_with @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_path, notice: 'O cargo foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to jobs_path, notice: 'O cargo foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
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

    def modal_responder
      respond_modal_with set_job
    end

end