class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comments = Comment.all
  end

  def edit
  end

  def create
    @comment = Comment.new(comments_params)

    @comment.user = current_user

    if @comment.save
        redirect_to post_path(@comment.post)
    else
        @post = Post.all
        render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update
    redirect_to root_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private
  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end

end