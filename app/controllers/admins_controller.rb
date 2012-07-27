class AdminsController < ApplicationController
  before_filter :authorize
  
  respond_to :html, :json, :xml
  
  def index
    if params[:l].blank?
      limit = 10
    else
      limit = params[:l]
    end
    @last_articles = Post.limit(limit)
  end
  
  def show
    @post = Post.find(params[:id])
    respond_with @post
  end
  
  def comments
    @comment = Comment.paginate page: params[:page], order: 'data_p desc', per_page: 10
    respond_with @comment
  end
  
  def published
    @posts_p = Post.where(:published => 1).paginate page: params[:page], order: 'published desc', per_page: 10
    respond_with @posts_p
  end

  
  def npublished
    @posts_no_p = Post.where(:published => 0).paginate page: params[:page], order: 'published desc', per_page: 10
    respond_with @posts_no_p
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    Time.zone = "Kyiv"
    @post.date_create = Time.zone.now if params[:date_create].blank?
    @post.save
    flash[:notice] = "The article was successfully create!"
    respond_with @post, location:admin_path(@post)
  end


  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    flash[:notice] = "Update success!"
    respond_with @post, location:admin_path(@post)
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "The article has successfully deleted!"
    respond_with @post, location:admins_url
  end
  
protected
  def authorize
    unless AdminLogin.find_by_id(session[:login_user])
      redirect_to login_url, :alert=>"Please login"
    end
  end
  
end
