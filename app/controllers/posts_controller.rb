class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    if @post.save
      redirect_to posts_path(@post),notice:'投稿完了しました:)'
    else 
      render:new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id),notice:'投稿完了しました:)'
    else
      render:edit
    end
  end

  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    end
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end

   
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
