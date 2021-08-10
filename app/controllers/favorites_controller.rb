class FavoritesController < ApplicationController
  # after_create_commit :create_activities

  def create
    # お気に入りに紐づく投稿取得
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    @post = Post.find(params[:post_id])
    @post.create_notification_by(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
  end

  # private
  # def create_activities
  #   post.create_notification(current_user, post._user)
  # end
end
