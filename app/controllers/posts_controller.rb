class PostsController < ApplicationController
  layout 'standard'

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = if @user.present?
               @user.posts.page params[:page]
             else
               []
             end
  end

  def show
    @comment = Comment.new
    @current_user = current_user
    @post = Post.includes(:comments).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @post = 'There are no posts'
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find_by(id: params[:user_id])
    @post = Post.new(author: user, title: post_params[:title], text: post_params[:text])
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path
    else
      flash[:success] = "Invalid input, post wasn't saved"
      redirect_to new_user_post_path(user_id: params[:user_id])
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
