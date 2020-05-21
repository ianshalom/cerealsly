class PagesController < ApplicationController
  def home
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    #@comments = Comment.where(post_id: @post.id)
  end


end