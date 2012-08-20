# encoding: utf-8

class PostsController < ApplicationController
  
  before_filter :authenticate_admin_auth!
 
  respond_to :html, :json, :xml
  
  def index
    if params[:l].blank?
      limit = 10
    else
      limit = params[:l]
    end
    sort = sort_param(params[:s]) unless params[:s].blank?
    sort ||="id"
    
    typeq = type_sort(params[:q]) unless params[:q].blank?
    typeq ||="asc"
    
    @last_articles = Post.limit(limit).published.ordering(sort, typeq)
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
    typeq = type_sort(params[:q]) unless params[:q].blank?
    sort = sort_param(params[:s]) unless params[:s].blank?
    @posts_p = Post.published.ordering(sort, typeq).paginate page: params[:page], order: 'date_create desc', per_page: 10
    respond_with @posts_p
    #test
  end

  
  def npublished
    typeq = type_sort(params[:q]) unless params[:q].blank?
    sort = sort_param(params[:s]) unless params[:s].blank?
    @posts_no_p = Post.nopublished.ordering(sort, typeq).paginate page: params[:page], order: 'date_create desc', per_page: 10
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
    
    respond_with(@post) do |format|
      if @post.save
        format.html{redirect_to post_path(@post), notice:"The article was successfully create!"}
      else
        format.html{render action:"new"}
        format.json{render json: @post.errors, status: :unprocessable_entity}
      end
    
    end  
    
  end


  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    if @post.save
      flash[:notice] = "Update success!"
    end
    respond_with @post, location:post_path(@post)
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "The article has successfully deleted!"
    respond_with @post, location:posts_url
  end
  
  def edit_comment
    @comment = Comment.find(params[:id])
  end
  
  def update_comment
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    flash[:notice] = "Comment Update success!"
    redirect_to posts_comments_path
  end
  
  def search 
    unless params[:q].blank?    
      @search = Post.search(params[:q].strip).paginate page: params[:page], order: 'date_create desc', per_page: 10
    else
      @search = []
    end
    
  end
  
  def subscribes
    @subscribes = Subscribe.paginate page: params[:page], order: 'id desc', per_page: 10
  end
  
  
  
  def dosending
      flash[:notice] = "aeeee"
      @subscibe = Subscribe.all
      SubscribeMailer.websitenews(@subscibe).deliver
      redirect_to posts_subscribes_path, notice:"Рассылка прошла успешно!"
    
  end
  
private
  def type_sort(t)
    case t
    when 'up'
      'asc'
    when 'down'
      'desc'
    else
      'desc'
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
