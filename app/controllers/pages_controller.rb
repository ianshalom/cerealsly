class PagesController < ApplicationController
  def home
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    puts '####################'
    puts @posts.first.comments
    puts '####################'

  end


end