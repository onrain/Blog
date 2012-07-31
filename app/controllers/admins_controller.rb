class AdminsController < ApplicationController
  
  before_filter :authenticate_admin_auth!
 
  respond_to :html, :json, :xml
  
  def index
    if params[:l].blank?
      limit = 10
    else
      limit = params[:l]
    end
    sort = sort_param(params[:s]) unless params[:s].blank?  
    @last_articles = Post.limit(limit).published.ordering(sort)
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
    sort = sort_param(params[:s]) unless params[:s].blank?
    @posts_p = Post.published.ordering(sort).paginate page: params[:page], order: 'date_create desc', per_page: 10
    respond_with @posts_p
  end

  
  def npublished
    sort = sort_param(params[:s]) unless params[:s].blank?
    @posts_no_p = Post.nopublished.ordering(sort).paginate page: params[:page], order: 'date_create desc', per_page: 10
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
  
  def edit_comment
    @comment = Comment.find(params[:id])
  end
  
  def update_comment
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    flash[:notice] = "Comment Update success!"
    redirect_to admins_comments_path
  end
  
  def search
      
    begin   
      @search = Post.search(params[:q].strip).paginate page: params[:page], order: 'date_create desc', per_page: 10
    rescue
      @search = []
    end
    
  end
  
private
  def sort_param(s)
    case s
    when "aid"
      sort = "id"
    when "aimg"
      sort = "image"
    when "atitle"
      sort = "title"
    when "apub"
      sort = "published"
    when "acreate"
      sort = "date_create"
    when "adesc"
      sort = "article_description"
    when "acont"
      sort = "article_content"
    else
      sort = "id"
    end
  end
    
end
