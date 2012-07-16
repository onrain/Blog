class AdminsController < ApplicationController
  before_filter :authorize
  
  respond_to :html, :json, :xml
  
  def index
  
  end
  
  def show
    @admin = Admin.find(params[:id])
    respond_with @admin
  end
  
  def comments
    @comment = Comment.paginate page: params[:page], order: 'data_p desc', per_page: 10
    respond_with @comment
  end
  
  def published
    @admins_p = Admin.where(:published => 1).paginate page: params[:page], order: 'published desc', per_page: 10
    respond_with @admins_p
  end

  
  def npublished
    @admins_no_p = Admin.where(:published => 0).paginate page: params[:page], order: 'published desc', per_page: 10
    respond_with @admins_no_p
  end

  def new
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    @admin.save
    respond_with @admin
  end


  def update
    @admin = Admin.find(params[:id])
    @admin.update_attributes(params[:admin])
    respond_with @admin
  end


  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    respond_with @admin
  end
  
protected
  def authorize
    unless AdminLogin.find_by_id(session[:login_user])
      redirect_to login_url, :alert=>"Please login"
    end
  end
end
