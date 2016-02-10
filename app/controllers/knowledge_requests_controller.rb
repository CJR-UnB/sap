class KnowledgeRequestsController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_knowledge_request, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    if current_member.try(:user?)
      @knowledge_requests = KnowledgeRequest.where(member_id: current_member.id).order(:id)
    else
      @knowledge_requests = KnowledgeRequest.all.order(:id)
    end
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
        format.html { redirect_to :back, notice: 'A requisição de conhecimento foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @knowledge_request }
      else
        format.html { render :new }
        format.json { render json: @knowledge_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def aprovar_conhecimento

    aprovado = RequestStatus.where(description: 'Deferido').try(:first).try(:id)

    respond_to do |format|

      @conhecimento = KnowledgesMember.new(member_id: @knowledge_request.member.id, knowledge_id: @knowledge_request.knowledge.id)

      if @conhecimento.save 

        @knowledge_request.update(request_status_id: aprovado)

        @historico = RequestHistory.new(knowledge_request_id: @knowledge_request.id, observation:'A requisição foi deferida.')

        if @historico.save
          format.html { redirect_to :back, notice: 'A requisição foi aprovada!' }
        end

      end

    end
  end

  def recusar_conhecimento

    recusado = RequestStatus.where(description: 'Indeferido').try(:first).try(:id)

    respond_to do |format|

      if @knowledge_request.update(request_status_id: recusado)

        @historico = RequestHistory.new(knowledge_request_id: @knowledge_request.id, observation:'A requisição foi indeferida.')

        if @historico.save
          format.html { redirect_to :back, notice: 'A requisição foi recusada!' }
        end

      end

    end
  end  

  def analisar_conhecimento

    em_analise = RequestStatus.where(description: 'Em análise').try(:first).try(:id)
    membro = @knowledge_request.member.id
    conhecimento = @knowledge_request.knowledge.id

    respond_to do |format|

      if @knowledge_request.update(request_status_id: em_analise)

        @conhecimento_associado = KnowledgesMember.where(member_id: membro, knowledge_id: conhecimento).first
        @conhecimento_associado.destroy

        @historico = RequestHistory.new(knowledge_request_id: @knowledge_request.id, observation:'Requisição em análise.')

        if @historico.save
          format.html { redirect_to :back, notice: 'A requisição está em análise!' }
        end

      end

    end

  end

  def update
    respond_to do |format|
      if @knowledge_request.update(knowledge_request_params)
        format.html { redirect_to :back, notice: 'A requisição de conhecimento foi atualizada com sucesso!' }
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
      format.html { redirect_to :back, notice: 'A requisição de conhecimento foi deletada com sucesso!' }
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