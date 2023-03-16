class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = if @user.present?
               @user.posts.page params[:page]
             else
               []
             end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @post = 'There are no posts'
  end
end
