class RequestStatusesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_request_status, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @request_statuses = RequestStatus.all
  end

  def show
  end

  def new
    respond_modal_with @request_status = RequestStatus.new
  end

  def edit
  end

  def create
    @request_status = RequestStatus.new(request_status_params)

    respond_to do |format|
      if @request_status.save
        format.html { redirect_to @request_status, notice: 'O status de requisição foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @request_status }
      else
        format.html { render :new }
        format.json { render json: @request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request_status.update(request_status_params)
        format.html { redirect_to @request_status, notice: 'O status de requisição foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @request_status }
      else
        format.html { render :edit }
        format.json { render json: @request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request_status.destroy
    respond_to do |format|
      format.html { redirect_to request_statuses_url, notice: 'O status de requisição foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_request_status
      @request_status = RequestStatus.find(params[:id])
    end

    def request_status_params
      params.require(:request_status).permit(:description)
    end

    def modal_responder
      respond_modal_with set_request_status
    end

end