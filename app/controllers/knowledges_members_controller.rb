class KnowledgesMembersController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_knowledges_member, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index

    if current_member.try(:user?)
      @search = KnowledgesMember.where(member_id: current_member.id).ransack(params[:q])
    else
      @search = KnowledgesMember.ransack(params[:q])
    end

    @knowledges_members = @search.result.joins(:knowledge, :member)

  end

  def show
  end

  def new
    respond_modal_with @knowledges_member = KnowledgesMember.new
  end

  def edit
  end

  def create
    @knowledges_member = KnowledgesMember.new(knowledges_member_params)

    respond_to do |format|
      if @knowledges_member.save
        format.html { redirect_to :back, notice: 'O conhecimento foi associado com sucesso!' }
        format.json { render :show, status: :created, location: @knowledges_member }
      else
        format.html { render :new }
        format.json { render json: @knowledges_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @knowledges_member.update(knowledges_member_params)
        format.html { redirect_to :back, notice: 'A associação foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @knowledges_member }
      else
        format.html { render :edit }
        format.json { render json: @knowledges_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @knowledges_member.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'O conhecimento foi desassociado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_knowledges_member
      @knowledges_member = KnowledgesMember.find(params[:id])
    end

    def knowledges_member_params
      params.require(:knowledges_member).permit(:member_id, :knowledge_id)
    end

    def modal_responder
      respond_modal_with set_knowledges_member
    end

end