class CommentsController < ApplicationController
  before_filter :require_signed_in_user, only: [ :index, :edit, :update, :destroy]
  before_filter :require_admin_user, only: [:index, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  
  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    #@comment = Comment.new(params[:comment])
    blog_id = cookies[:blog_id]
    @blog = Blog.find(blog_id)
    @comment = @blog.comments.build(content: params[:comment][:content])

    if @comment.save
      redirect_to blog_path(blog_id)
    else
      flash[:error] = 'Comment was not saved'
      redirect_to blog_path(blog_id)
    end
    

  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.blog}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
