class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.paginate page: params[:page], order: 'data_p desc', per_page: 10
    
    @articles = Admin.where(:published => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    #@comment = Comment.find(params[:id])
    
    @articles = Admin.find(params[:id])
    
    #@comments_q = Comment.where("post_id = #{params[:id]}")
    @comments_q = Comment.find_all_by_post_id(params[:id]).paginate page: params[:page], order: 'data_p desc', per_page: 5
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end


  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.data_p = Time.now
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.env['HTTP_REFERER'], notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html {redirect_to request.env['HTTP_REFERER'], notice: "Please leave your comment." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end
end
