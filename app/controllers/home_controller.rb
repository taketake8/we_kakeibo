class HomeController < ApplicationController
  def index
    @pays = Pay.includes(:user)
  end
end
