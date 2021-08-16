class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(status: true).order('created_at DESC').page(params[:page]).per(20)
    @point=@user.passive_points.all
    @posts_tag = @user.tags.order('created_at DESC').limit(15)
  end

  def index
    users = User.where(is_valid: true)
    @users = users.order(params[:sort]).page(params[:page]).per(12)
    @departments=Department.all
  end

  def edit
    @user = User.find(params[:id])
    @departments = Department.all
  end

  def update
    @departments=Department.all
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:"更新完了しました:)"
    else
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    # このユーザーがしたいいね　そしてそのpost_id
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
  
  def comments
    @user = User.find(params[:id])
    comments = PostComment.where(user_id: @user.id).pluck(:post_id)
    @comment_posts=Post.find(comments)
  end

  def confirm
    @user = User.find(params[:id])
    @posts = Post.where(status: false).order('created_at DESC')
  end

  def destroy_confirm
    @user = current_user
  end
  
  def destroy_user
    @user = current_user
      if @user.email=='guest@example.com'
        reset_session
        redirect_to :root
      else
        @user.update(is_valid: false)
        reset_session
        redirect_to :root
      end
  end
  


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :join_year, :department_id)
  end
end
