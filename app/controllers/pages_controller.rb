class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)

  end




end