class PostCommentsController < ApplicationController
  
  def create
    post=Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    @post=Post.find(params[:post_id])
    @post_comment = PostComment.new
    @post.create_notification_by(current_user)
    respond_to do |format|
        format.html {redirect_to request.referer}
        format.js
    end
    # 非同期通信のためrender系は削除
    # redirect_to post_path(post)
    # 非同期通信のため以下の値を追加で定義
    
  end
  
  def destroy
    # 非同期通信実施ため、@post @post_comの値を定義
    @post=Post.find(params[:post_id])
    @post_comment=PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @post_comment.destroy
    @post_comment = PostComment.new
    # 非同期通信のためrender削除
    # redirect_to post_path(params[:post_id])
  end
  
  private
    def post_comment_params
    params.require(:post_comment).permit(:comment)
    end
end
