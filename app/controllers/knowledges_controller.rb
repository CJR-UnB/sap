class KnowledgesController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_knowledge, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @knowledges = Knowledge.all
  end

  def show
  end

  def new
    respond_modal_with @knowledge = Knowledge.new
  end

  def edit
  end

  def create
    @knowledge = Knowledge.new(knowledge_params)

    respond_to do |format|
      if @knowledge.save
        format.html { redirect_to knowledges_path, notice: 'O conhecimento foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @knowledge }
      else
        format.html { render :new }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def requisitar

    em_analise = RequestStatus.where(description: 'Em análise').first.id
    @requisicao = KnowledgeRequest.new(knowledge_id: @knowledge.id, member_id: current_member.id, request_status_id: em_analise)

    respond_to do |format|
      if @requisicao.save

        @historico = RequestHistory.new(knowledge_request_id: @requisicao.id, observation:'Conhecimento requisitado.')
        @historico.save

        format.html { redirect_to :back, notice: 'O conhecimento foi requisitado ao administrador.' }
      end
    end

  end

  def update
    respond_to do |format|
      if @knowledge.update(knowledge_params)
        format.html { redirect_to knowledges_path, notice: 'O conhecimento foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @knowledge }
      else
        format.html { render :edit }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @knowledge.destroy
    respond_to do |format|
      format.html { redirect_to knowledges_url, notice: 'O conhecimento foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_knowledge
      @knowledge = Knowledge.find(params[:id])
    end

    def knowledge_params
      params.require(:knowledge).permit(:description, :knowledge_level_id, :technology_id)
    end

    def modal_responder
      respond_modal_with set_knowledge
    end

end