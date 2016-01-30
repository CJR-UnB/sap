class MembersController < ApplicationController

  before_action :authenticate_member!
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
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

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :last_name, :job_id, :sector_id, :area_id, :role_id, :email, :password, :password_confirmation)
    end

end