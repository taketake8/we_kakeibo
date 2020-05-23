class PaysController < ApplicationController
  before_action :set_pay, only: [:show, :edit, :update, :destroy]

  # GET /pays
  # GET /pays.json
  def index
    @pays = Pay.includes(:user)
    @user = User.find_by(id: current_user.id)
    @search = Pay.search(params[:q])
    @pays_days = @search.result
    respond_to do |format|
      format.html 
      format.json { render json: @pays_days }
    end
  end

  # GET /pays/1
  # GET /pays/1.json
  def show
  end

  # GET /pays/new
  def new
    @pay = Pay.new
  end

  # GET /pays/1/edit
  def edit
  end

  # POST /pays
  # POST /pays.json
  def create
    @pay = Pay.new(pay_params)

    respond_to do |format|
      if @pay.save
        format.html { redirect_to pays_path, notice: '保存ができました' }
        format.json { render :show, status: :created, location: @pay }
      else
        format.html { render :new }
        format.json { render json: @pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pays/1
  # PATCH/PUT /pays/1.json
  def update
    respond_to do |format|
      if @pay.update(pay_params)
        format.html { redirect_to @pay, notice: 'Pay was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay }
      else
        format.html { render :edit }
        format.json { render json: @pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pays/1
  # DELETE /pays/1.json
  def destroy
    @pay.destroy
    respond_to do |format|
      format.html { redirect_to pays_url, notice: 'Pay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay
      @pay = Pay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pay_params
      params.require(:pay).permit(:start_time,:price, :memo).merge(user_id: current_user.id)
    end
end
