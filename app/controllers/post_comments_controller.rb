class PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = post.id
    @post = Post.find(params[:post_id])
    if @comment.save
      # ユーザーステータス無効で、投稿者とコメント者が等しいとき
      unless current_user==@post.user || @post.user.is_valid == false
      @post.create_notification_by(current_user)
      end
      @post_comment = PostComment.new
    else
      render 'error'   
    end
  end

  def destroy
    # 非同期通信実施ため、@post @post_comの値を定義
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @post_comment.destroy
    @post_comment = PostComment.new
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
