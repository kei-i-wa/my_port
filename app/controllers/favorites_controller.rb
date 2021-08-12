class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    @post = Post.find(params[:post_id])
    
    unless @post.user == current_user
    @post.point_by(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    # @post.destroy_point_by(current_user)
    # respond_to do |format|
    #   format.html { redirect_to request.referer }
    #   format.js
    # end
  end
end
