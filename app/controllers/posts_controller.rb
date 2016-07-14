class PostsController < ApplicationController

  def index
    @post = Post.order(created_at: :desc).first
    @footerposts = Post.where.not(id: @post.id).order(created_at: :desc).limit(4)
    @title = "Surf-N-Paddle Blog"

  end

  def show
    @post = Post.find(params[:id])
    @footerposts = Post.where.not(id: @post.id).order(created_at: :desc).limit(4)
    @title = @post.title
    @header = @post.id

  end

  def new
    @post = Post.new
    @title = "Create a post"
    @footerposts = Post.order(created_at: :desc).limit(4)
  end

  def create
    @footerposts = Post.order(created_at: :desc).limit(4)
    @title = "Create a post"
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @footerposts = Post.order(created_at: :desc).limit(4)
    @title = "Edit a post"
  end

  def update
    @footerposts = Post.order(created_at: :desc).limit(4)
    @title = "Edit a post"
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id, :image)
  end

end
