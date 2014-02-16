class BlogsController < ApplicationController
  before_filter :require_signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :require_admin_user, only: [:edit, :update, :destroy]
  after_filter  :increment_view_count, only: :show

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs =  Blog.where(visible:true).paginate(page: params[:page], per_page: 8)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    if request.path != blog_path(@blog)
      redirect_to @blog, status: :moved_permanently
    end

    #cookies[:blog_id] = {value: params[:id]}
    #@comment = Comment.new
    #@comments = @blog.comments.paginate(page: params[:page], per_page: 10)
    
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'   
    else
      render action: "new"
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(params[:blog])
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render action: "edit"
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_url
  end
end
