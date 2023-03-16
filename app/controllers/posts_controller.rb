class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    if @user.present?
      @posts = @user.posts.page params[:page]
    else
      @posts = []
    end

  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || 'There are no posts'
  end
end
