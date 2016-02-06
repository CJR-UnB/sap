class RolesController < ApplicationController
  
  respond_to :html, :json
  before_action :authenticate_member!
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]
  load_and_authorize_resource except: [:create]

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    respond_modal_with @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: 'O perfil foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to roles_path, notice: 'O perfil foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'O perfil foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:description)
    end

    def modal_responder
      respond_modal_with set_role
    end

end