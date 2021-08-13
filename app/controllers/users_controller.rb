class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # posts=@user.Post.page(params[:page]).per(8)
    @posts = @user.posts.where(status: true).order('created_at DESC').page(params[:page]).per(8)
    # myport全体の投稿数確認のため
    @posts_all = Post.where(status: true)
    @point=@user.passive_points.all
    # @posts_tag=@user.tags.order('count(@user.tags) DESC')
    # @posts_tag = User.find(PostTag.group(:user_id).order('count(user_id) desc').pluck(:user_id))
    # @posts_tag = @user.tags.order('count(post_id) desc')
    @posts_tag = @user.tags.order('created_at DESC')
  end

  def index
    users = User.where(is_valid: true)
    @users = users.order(params[:sort]).page(params[:page]).per(12)
  end

  def edit
    @user = User.find(params[:id])
    @departments = Department.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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

  def destroy
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :join_year, :department_id, :is_valid)
  end
end
