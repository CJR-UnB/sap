class KnowledgeRequestsController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_knowledge_request, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @knowledge_requests = KnowledgeRequest.all
  end

  def show
  end

  def new
    respond_modal_with @knowledge_request = KnowledgeRequest.new
  end

  def edit
  end

  def create
    @knowledge_request = KnowledgeRequest.new(knowledge_request_params)

    respond_to do |format|
      if @knowledge_request.save
        format.html { redirect_to knowledge_requests_path, notice: 'A requisição de conhecimento foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @knowledge_request }
      else
        format.html { render :new }
        format.json { render json: @knowledge_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @knowledge_request.update(knowledge_request_params)
        format.html { redirect_to knowledge_request_path, notice: 'A requisição de conhecimento foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @knowledge_request }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @knowledge_request.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_requests_url, notice: 'A requisição de conhecimento foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_knowledge_request
      @knowledge_request = KnowledgeRequest.find(params[:id])
    end

    def knowledge_request_params
      params.require(:knowledge_request).permit(:member_id, :knowledge_id, :request_status_id)
    end

    def modal_responder
      respond_modal_with set_knowledge_request
    end

end