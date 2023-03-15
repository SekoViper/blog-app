class PostsController < ApplicationController
  def index
    @posts = User.find_by(id: params[:user_id])&.posts || []
  end

  def show
    puts Post.where(author_id: params[:user_id], id: params[:id])
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || 'There are no posts'
  end
end
