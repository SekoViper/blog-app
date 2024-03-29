class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts, :comments).find_by(id: params[:id]) || 'There is no user'
    @posts = @user.posts.limit(3).page(params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User saved successfully'
      redirect_to users_path
    else
      flash.now[:error] = "Error: couldn't save user"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :photo)
  end
end
