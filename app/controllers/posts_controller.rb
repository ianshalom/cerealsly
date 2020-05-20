class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comments = Comment.all
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id)

  end

  def new
    @post = Post.new

  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user

   if @post.save
    flash[:notice] = "Post was created successfully."
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.user = current_user

    if @post.update(posts_params)
      flash[:notice] = "Post was updated successfully."
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :body, :img_url)
  end
end