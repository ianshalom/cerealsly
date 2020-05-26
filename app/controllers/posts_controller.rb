class PostsController < ApplicationController

  def index
    @posts = Post.order("posts.created_at DESC").paginate(page: params[:page], per_page: 9)

    @like = Like.group('post_id').order('count(*) DESC').limit(1).pluck(:post_id).first

    @post = Post.find(@like)

    puts '######################'
    # puts @post
    puts '######################'

    @comments = Comment.all
    @users = User.all
    @user = current_user

  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order(:created_at).reverse


    @user = current_user
  end

  def new
    @user = current_user
    @post = Post.new
    @maximum_length = Post.validators_on( :body ).first.options[:maximum]
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
    @maximum_length = Post.validators_on( :body ).first.options[:maximum]
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user

   if @post.save
    flash[:notice] = "Post was created successfully."
      redirect_to @post
    else
      flash[:notice] = "Some fields are empty."
      redirect_back(fallback_location: root_path)
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
    flash[:notice] = "Post was deleted successfully."
    redirect_to posts_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :body, :img_url, category_ids: [])
  end
end