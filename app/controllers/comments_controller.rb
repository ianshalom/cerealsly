class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comments_params)

    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Your comment has been successfully added."
        redirect_to post_path(@comment.post)
    else
      @post = Post.find(@comment.post.id)
      @comments = @post.comments
      render :template => 'posts/show'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update
    redirect_to post_path(@comment.post)
  end

  def destroy
    # puts '##############'
    # puts
    # puts '##############'


    @comment = Comment.find(params[:id])
    @comment.destroy
    if params[:from]
      redirect_to profile_path(current_user)
      flash[:notice] = "Comment was deleted successfully."
    else
    flash[:notice] = "Comment was deleted successfully."
    redirect_to post_path(@comment.post)
  end
  end

  private
  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end

end