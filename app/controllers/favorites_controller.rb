class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # お気に入りに紐づく投稿取得
    post=Post.find(params[:post_id])
    favorite=current_user.favorites.new(post_id: post.id)
    favorite.save
    # 非同期通信のため以下削除/@post上部追記
    # redirect_to request.referer
    
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    post=Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
  end

end
