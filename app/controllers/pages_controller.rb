class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order("posts.created_at DESC").paginate(page: params[:page], per_page: 6)

  end




end