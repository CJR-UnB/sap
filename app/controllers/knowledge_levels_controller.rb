class KnowledgeLevelsController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_knowledge_level, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @knowledge_levels = KnowledgeLevel.all
  end

  def show
  end

  def new
    respond_modal_with @knowledge_level = KnowledgeLevel.new
  end

  def edit
  end

  def create
    @knowledge_level = KnowledgeLevel.new(knowledge_level_params)

    respond_to do |format|
      if @knowledge_level.save
        format.html { redirect_to knowledge_levels_path, notice: 'O nível de conhecimento foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @knowledge_level }
      else
        format.html { render :new }
        format.json { render json: @knowledge_level.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @knowledge_level.update(knowledge_level_params)
        format.html { redirect_to knowledge_levels_path, notice: 'O nível de conhecimento foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @knowledge_level }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @knowledge_level.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_levels_url, notice: 'O nível de conhecimento foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_knowledge_level
      @knowledge_level = KnowledgeLevel.find(params[:id])
    end

    def knowledge_level_params
      params.require(:knowledge_level).permit(:level, :description)
    end

    def modal_responder
      respond_modal_with set_knowledge_level
    end

end