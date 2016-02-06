class RequestHistoriesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_request_history, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @request_histories = RequestHistory.all
  end

  def show
  end

  def new
    respond_modal_with @request_history = RequestHistory.new
  end

  def edit
  end

  def create
    @request_history = RequestHistory.new(request_history_params)

    respond_to do |format|
      if @request_history.save
        format.html { redirect_to request_histories_path, notice: 'O histórico da requisição foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @request_history }
      else
        format.html { render :new }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request_history.update(request_history_params)
        format.html { redirect_to request_histories_path, notice: 'O histórico da requisição foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @request_history }
      else
        format.html { render :edit }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request_history.destroy
    respond_to do |format|
      format.html { redirect_to request_histories_url, notice: 'O histórico da requisição foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_request_history
      @request_history = RequestHistory.find(params[:id])
    end

    def request_history_params
      params.require(:request_history).permit(:knowledge_request_id, :observation)
    end

    def modal_responder
      respond_modal_with set_request_history
    end

end