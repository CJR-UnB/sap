class MembersController < ApplicationController

  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]

  def index
    @members = Member.all
  end

  def show
  end

  def new
    respond_modal_with @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: "O membro foi criado com sucesso!" }
        format.json { render :index, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render :json, @member.erros, status: :unprocessable_entity }
      end
    end
  end

  def update

    # Isso aqui permite que o usuário edite as informações sem precisar atualizar a senha
    if params[:member][:password].blank? && params[:member][:password_confirmation].blank?
        params[:member].delete(:password)
        params[:member].delete(:password_confirmation)
    end

    respond_to do |format|
      if @member.update_attributes(params[:member].permit(:name, :last_name, :member_status_id, :job_id, :sector_id, :area_id, :role_id, :email, :password, :password_confirmation))
        if @member == current_member
          format.html { redirect_to :back, notice: 'O seu perfil foi atualizado com sucesso.' }
        else
          format.html { redirect_to :back, notice: 'O perfil do membro foi atualizado com sucesso.' }
        end
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member.delete
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'O membro foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :last_name, :member_status_id, :job_id, :sector_id, :area_id, :role_id, :email, :password, :password_confirmation)
    end

    def modal_responder
      respond_modal_with set_member
    end

end