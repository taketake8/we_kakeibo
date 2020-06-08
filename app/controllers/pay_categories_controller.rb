class PayCategoriesController < ApplicationController
  before_action :set_pay_category, only: [:show, :edit, :update, :destroy]

  def index 
    @pay_categories=PayCategory.all
    @pay_categories=PayCategory.where(user_id: current_user.id).or(PayCategory.where(user_id: nil)).page(params[:page]).per(9).order(id: "DESC")
    @pay_category = PayCategory.new
  end

  def create
    @pay_category = PayCategory.new(pay_category_params)
    respond_to do |format|
      if  @pay_category.save 
        format.html { redirect_to pay_categories_path, notice: '保存ができました' }
        format.json { render :index, status: :created, location: @pay_category }
      else
        @pay_categories=PayCategory.all.page(params[:page]).per(9).order(id: "DESC")
        format.html { render :index }
        format.json { render json: @pay_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pay_category.destroy
    respond_to do |format|
      format.html { redirect_to pay_categories_path, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def pay_category_params
      params.require(:pay_category).permit(:name).merge(user_id: current_user.id)
    end
    def set_pay_category
      @pay_category=PayCategory.find(params[:id])  
    end
end
