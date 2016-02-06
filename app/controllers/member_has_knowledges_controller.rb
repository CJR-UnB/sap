class MemberHasKnowledgesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_member_has_knowledge, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @member_has_knowledges = MemberHasKnowledge.all
  end

  def show
  end

  def new
    respond_modal_with @member_has_knowledge = MemberHasKnowledge.new
  end

  def edit
  end

  def create
    @member_has_knowledge = MemberHasKnowledge.new(member_has_knowledge_params)

    respond_to do |format|
      if @member_has_knowledge.save
        format.html { redirect_to member_has_knowledges_path, notice: 'O conhecimento do membro foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @member_has_knowledge }
      else
        format.html { render :new }
        format.json { render json: @member_has_knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member_has_knowledge.update(member_has_knowledge_params)
        format.html { redirect_to member_has_knowledges_path, notice: 'O conhecimento do membro foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @member_has_knowledge }
      else
        format.html { render :edit }
        format.json { render json: @member_has_knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member_has_knowledge.destroy
    respond_to do |format|
      format.html { redirect_to member_has_knowledges_url, notice: 'O conhecimento do membro foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_member_has_knowledge
      @member_has_knowledge = MemberHasKnowledge.find(params[:id])
    end

    def member_has_knowledge_params
      params.require(:member_has_knowledge).permit(:member_id, :knowledge_id)
    end

    def modal_responder
      respond_modal_with set_member_has_knowledge
    end

end