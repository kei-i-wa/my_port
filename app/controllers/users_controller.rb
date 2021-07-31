class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @posts = Post.order('id DESC').limit(4)
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
