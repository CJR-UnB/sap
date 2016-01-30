class MemberHasKnowledgesController < ApplicationController
  before_action :set_member_has_knowledge, only: [:show, :edit, :update, :destroy]

  # GET /member_has_knowledges
  # GET /member_has_knowledges.json
  def index
    @member_has_knowledges = MemberHasKnowledge.all
  end

  # GET /member_has_knowledges/1
  # GET /member_has_knowledges/1.json
  def show
  end

  # GET /member_has_knowledges/new
  def new
    @member_has_knowledge = MemberHasKnowledge.new
  end

  # GET /member_has_knowledges/1/edit
  def edit
  end

  # POST /member_has_knowledges
  # POST /member_has_knowledges.json
  def create
    @member_has_knowledge = MemberHasKnowledge.new(member_has_knowledge_params)

    respond_to do |format|
      if @member_has_knowledge.save
        format.html { redirect_to @member_has_knowledge, notice: 'Member has knowledge was successfully created.' }
        format.json { render :show, status: :created, location: @member_has_knowledge }
      else
        format.html { render :new }
        format.json { render json: @member_has_knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_has_knowledges/1
  # PATCH/PUT /member_has_knowledges/1.json
  def update
    respond_to do |format|
      if @member_has_knowledge.update(member_has_knowledge_params)
        format.html { redirect_to @member_has_knowledge, notice: 'Member has knowledge was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_has_knowledge }
      else
        format.html { render :edit }
        format.json { render json: @member_has_knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_has_knowledges/1
  # DELETE /member_has_knowledges/1.json
  def destroy
    @member_has_knowledge.destroy
    respond_to do |format|
      format.html { redirect_to member_has_knowledges_url, notice: 'Member has knowledge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_has_knowledge
      @member_has_knowledge = MemberHasKnowledge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_has_knowledge_params
      params.require(:member_has_knowledge).permit(:member_id, :knowledge_id)
    end
end
