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
  end

  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    if @post.save
      redirect_to posts_path(@post),notice:'You have created book successfully.'
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    # respond_to do |format|
    #   if @post.update(post_params)
    #     format.html { redirect_to @post, notice: "Post was successfully updated." }
    #     format.json { render :show, status: :ok, location: @post }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
