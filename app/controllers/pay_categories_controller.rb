class PayCategoriesController < ApplicationController
  before_action :set_pay_category, only: [:show, :edit, :update, :destroy]

  def index 
    @pay_categories=PayCategory.all.page(params[:page]).per(9).order(id: "DESC")
    @pay_category = PayCategory.new

  end

  def create
    @pay_category = PayCategory.new(pay_category_params)
    @pay_category.save
  end

  def destroy
    @pay_category.destroy
  end

  private
    def pay_category_params
      params.require(:pay_category).permit(:name).merge(user_id: current_user.id)
    end
    def set_pay_category
      @pay_category=PayCategory.find(params[:id])  
    end
end
