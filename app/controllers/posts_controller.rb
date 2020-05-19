class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    @post.save
    redirect_to root_path
  end

  def update

  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :body, :img_url)
  end
end