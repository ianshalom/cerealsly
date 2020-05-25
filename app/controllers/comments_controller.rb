class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user = current_user

    if @comment.save
          flash[:notice] = "Your comment has been successfully added."
            redirect_back(fallback_location: root_path)
        else
          flash[:notice] = "Your comment cannot be empty."
            redirect_back(fallback_location: root_path)
      end
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
  
    if @comment.update(comments_params)
      flash[:notice] = "Comment was updated successfully."
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy

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