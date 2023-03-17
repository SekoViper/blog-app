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

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to users_path
    else
      render :new, alert: 'Error occured!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
