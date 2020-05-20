class PagesController < ApplicationController
  def home
  end

  def profile
    @user = User.first
    @posts = Post.where(user_id: @user.id)

  end


end