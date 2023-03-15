class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find_by(id: params[:id]) || 'There is no user'
  end
end
