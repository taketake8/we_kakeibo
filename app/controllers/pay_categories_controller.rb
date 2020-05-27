class PayCategoriesController < ApplicationController

  def index 
    @pay_categories=PayCategory.all
  end

  def show
    @pay_category=PayCategory.find(params[:id])
  end
end