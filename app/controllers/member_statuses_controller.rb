class MemberStatusesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_member_status, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @member_statuses = MemberStatus.all
  end

  def show
  end

  def new
    respond_modal_with @member_status = MemberStatus.new
  end

  def edit
  end

  def create
    @member_status = MemberStatus.new(member_status_params)

    respond_to do |format|
      if @member_status.save
        format.html { redirect_to member_statuses_path, notice: 'O status de membro foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @member_status }
      else
        format.html { render :new }
        format.json { render json: @member_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member_status.update(member_status_params)
        format.html { redirect_to member_statuses_path, notice: 'O status de membro foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @member_status }
      else
        format.html { render :edit }
        format.json { render json: @member_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member_status.destroy
    respond_to do |format|
      format.html { redirect_to member_statuses_url, notice: 'O status de membro foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_member_status
      @member_status = MemberStatus.find(params[:id])
    end

    def member_status_params
      params.require(:member_status).permit(:description)
    end

    def modal_responder
      respond_modal_with set_member_status
    end

end