class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @posts=Post.page(params[:page]).per(10)
  end

  def index
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction,:join_year)
  end
end
