class KnowledgesMembersController < ApplicationController
  before_action :set_knowledges_member, only: [:show, :edit, :update, :destroy]

  # GET /knowledges_members
  # GET /knowledges_members.json
  def index
    @knowledges_members = KnowledgesMember.all
  end

  # GET /knowledges_members/1
  # GET /knowledges_members/1.json
  def show
  end

  # GET /knowledges_members/new
  def new
    @knowledges_member = KnowledgesMember.new
  end

  # GET /knowledges_members/1/edit
  def edit
  end

  # POST /knowledges_members
  # POST /knowledges_members.json
  def create
    @knowledges_member = KnowledgesMember.new(knowledges_member_params)

    respond_to do |format|
      if @knowledges_member.save
        format.html { redirect_to @knowledges_member, notice: 'Knowledges member was successfully created.' }
        format.json { render :show, status: :created, location: @knowledges_member }
      else
        format.html { render :new }
        format.json { render json: @knowledges_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledges_members/1
  # PATCH/PUT /knowledges_members/1.json
  def update
    respond_to do |format|
      if @knowledges_member.update(knowledges_member_params)
        format.html { redirect_to @knowledges_member, notice: 'Knowledges member was successfully updated.' }
        format.json { render :show, status: :ok, location: @knowledges_member }
      else
        format.html { render :edit }
        format.json { render json: @knowledges_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledges_members/1
  # DELETE /knowledges_members/1.json
  def destroy
    @knowledges_member.destroy
    respond_to do |format|
      format.html { redirect_to knowledges_members_url, notice: 'Knowledges member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledges_member
      @knowledges_member = KnowledgesMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledges_member_params
      params.require(:knowledges_member).permit(:member_id, :knowledge_id)
    end
end
