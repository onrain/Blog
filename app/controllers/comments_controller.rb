class CommentsController < ApplicationController
  
  caches_page :index, :show, :gzip => :best_speed
  
  respond_to :html, :json, :xml
  
  def index    
    @articles = Post.published.paginate page: params[:page], order: 'date_create desc', per_page: 10
    respond_with @articles
  end


  def show
    @articles = Post.find(params[:id])
    @comments_q = Comment.show_comment(params[:id]).paginate page: params[:page], order: 'data_p desc', per_page: 5
    @comment = Comment.new
    respond_with @articles
  end


  def create
    @comment = Comment.new(params[:comment])
    Time.zone = "Kyiv"
    @comment.data_p = Time.zone.now
    respond_with(@comment) do |format|
      if @comment.save
        format.html { redirect_to request.env['HTTP_REFERER'], alert: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html {redirect_to request.env['HTTP_REFERER'], notice: "Please leave your comment." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def search
    begin   
      @search = Post.search(params[:q].strip).paginate page: params[:page], order: 'date_create desc', per_page: 10
    rescue
      @search = []
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    flash[:aletr] = "This comment is last!" if Comment.count < 2
    if @comment.destroy
      flash[:notice] = "The article has successfully deleted!"
      respond_with @comment, location:request.env['HTTP_REFERER']
    end
  end
end
