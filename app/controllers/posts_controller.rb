class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  # 閲覧数はshowページでカウント
  impressionist :actions => [:show]

  def index
    posts=Post.order(params[:sort])
    @posts=posts.page(params[:page]).per(10)

    # タグを全表示するかどうかは悩み中
    # 多い順に50個とかのほうが良い？
    @tag_list=Tag.all
  end

  def show
    @post = Post.find(params[:id])
    # 閲覧数カウント、リロードしても閲覧数は
    impressionist(@post,nil,unique: [:session_hash.to_s])
    @post_comment=PostComment.new
    @post_tags = @post.tags
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    # pluckはmapでも可
    @tag_list=@post.tags.pluck(:name).join(',')
  end

  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    # 受け取った値を,で区切って配列にする
    tag_list=params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path(@post),notice:'投稿完了しました:)'
    else
      render:new
    end
  end

  def update
    @post = Post.find(params[:id])
    tag_list=params[:post][:name].split(',')
    if @post.update(post_params)
       @post.save_tag(tag_list)
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

  def search_tag
    @tag_list=Tag.all
    @tag=Tag.find(params[:tag_id])
    @posts=@tag.posts.page(params[:page]).per(10)
  end
  
  def favorite_order
     posts = Post.includes(:favorited_users).
      sort {|a,b| 
        b.favorited_users.includes(:favorites).size <=> 
        a.favorited_users.includes(:favorites).size
      }
     @posts=Kaminari.paginate_array(posts).page(params[:page]).per(20)
     
  end
  
  def favorite_weekly_order
      to=Time.current.at_end_of_day
      from=(to-6.day).at_beginning_of_day
      posts = Post.includes(:favorited_users).
      sort {|a,b| 
        b.favorited_users.includes(:favorites).where(created_at: from...to).size <=> 
        a.favorited_users.includes(:favorites).where(created_at: from...to).size
      }
     @posts=Kaminari.paginate_array(posts).page(params[:page]).per(15)
  
     
  end
  
  def comment_order
    posts=Post.includes(:commented_users).
    sort{|a,b|
    b.commented_users.includes(:post_comments).size<=>
    a.commented_users.includes(:post_comments).size
    }
    @posts=Kaminari.paginate_array(posts).page(params[:page]).per(25)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit(:title, :content)
    end
end
