class HomeController < ApplicationController
  def index
    @article = Admin.where("published = 1")
  end

  def show
    @article = Admin.find(params[:id])
  end
end