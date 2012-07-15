class AdminsController < ApplicationController
  before_filter :authorize
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end
  
  def show
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end
  
  def comments
    @comment = Comment.paginate page: params[:page], order: 'data_p desc', per_page: 10
  end
  
  def published
    @admins_p = Admin.where(:published => 1).paginate page: params[:page], order: 'published desc', per_page: 10
  end

  
  def npublished
    @admins_no_p = Admin.where(:published => 0).paginate page: params[:page], order: 'published desc', per_page: 10
  end

  def new
    @admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(params[:admin])
    
    expire_page :action => :index, :action=> :show, :controller=>:comments
    
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to request.env['HTTP_REFERER'], notice: "Deleted success." }
      format.json { head :no_content }
    end
  end
  
protected
  def authorize
    unless AdminLogin.find_by_id(session[:login_user])
      redirect_to login_url, :alert=>"Please login"
    end
  end
end
