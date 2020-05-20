class PagesController < ApplicationController
  def home
  end

  def profile
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)

  end


end