class MemberStatusesController < ApplicationController
  before_action :set_member_status, only: [:show, :edit, :update, :destroy]

  # GET /member_statuses
  # GET /member_statuses.json
  def index
    @member_statuses = MemberStatus.all
  end

  # GET /member_statuses/1
  # GET /member_statuses/1.json
  def show
  end

  # GET /member_statuses/new
  def new
    @member_status = MemberStatus.new
  end

  # GET /member_statuses/1/edit
  def edit
  end

  # POST /member_statuses
  # POST /member_statuses.json
  def create
    @member_status = MemberStatus.new(member_status_params)

    respond_to do |format|
      if @member_status.save
        format.html { redirect_to @member_status, notice: 'Member status was successfully created.' }
        format.json { render :show, status: :created, location: @member_status }
      else
        format.html { render :new }
        format.json { render json: @member_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_statuses/1
  # PATCH/PUT /member_statuses/1.json
  def update
    respond_to do |format|
      if @member_status.update(member_status_params)
        format.html { redirect_to @member_status, notice: 'Member status was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_status }
      else
        format.html { render :edit }
        format.json { render json: @member_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_statuses/1
  # DELETE /member_statuses/1.json
  def destroy
    @member_status.destroy
    respond_to do |format|
      format.html { redirect_to member_statuses_url, notice: 'Member status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_status
      @member_status = MemberStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_status_params
      params.require(:member_status).permit(:description)
    end
end
