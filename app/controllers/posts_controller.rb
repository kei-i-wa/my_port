class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  # 閲覧数はshowページでカウント
  impressionist actions: [:show]

  def index
    @posts = Post.where(status: true).order(params[:sort]).page(params[:page]).per(20)
    @tag_list = Tag.order('id DESC').limit(50)
  end

  def show
    @post = Post.find(params[:id])
    # 閲覧数カウント、リロードしても閲覧数は増えない
    impressionist(@post, nil, unique: [:session_hash.to_s])
    @post_comment = PostComment.new
    @post_tags = @post.tags
    # @comment = current_user.post_comments.new(post_comment_params)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    # pluckはmapでも可
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # 受け取った値を,で区切って配列にする
    # @postオブジェクトを参照してタグの名前取得
    # もし公開記事だったら、
      if @post.save
      tag_list = params[:post][:name].split(',')
        if params[:post][:status]== "公開"
          @post.save_tag(tag_list)
          redirect_to post_path(@post), notice: '投稿完了しました:)'
        else
          redirect_to posts_path, notice: '下書きに登録しました。'
        end
      else
        render :new
      end
  end

  def update
    # postのid持ってくる
    @post = Post.find(params[:id])
    # 入力されたタグを受け取る
    tag_list = params[:post][:name].split(',')
    # もしpostの情報が更新されたら
    if @post.update(post_params)
      if params[:post][:status]== "公開"
    # このpost_idに紐づいていたタグを@oldに入れる
        @old_relations=PostTag.where(post_id: @post.id)
    # それらを取り出し、消す。消し終わる
        @old_relations.each do |relation|
        relation.delete
        end  
         @post.save_tag(tag_list)
        redirect_to post_path(@post.id), notice: '更新完了しました:)'
      else redirect_to posts_path, notice: '下書きに登録しました。'
      end
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_path if @post.destroy
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page]).per(20)
  end

  def favorite_order
    posts = Post.includes(:favorited_users)
                .sort do |a, b|
      b.favorited_users.includes(:favorites).size <=>
        a.favorited_users.includes(:favorites).size
    end
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(20)
    @tag_list = Tag.order('id DESC').limit(50)
  end

  def favorite_weekly_order
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    posts = Post.includes(:favorited_users)
                .sort do |a, b|
      b.favorited_users.includes(:favorites).where(created_at: from...to).size <=>
        a.favorited_users.includes(:favorites).where(created_at: from...to).size
    end
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(20)
    @tag_list = Tag.order('id DESC').limit(50)
  end

  def comment_order
    posts = Post.includes(:commented_users)
                .sort do |a, b|
      b.commented_users.includes(:post_comments).size <=>
        a.commented_users.includes(:post_comments).size
    end
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(20)
    @tag_list = Tag.order('id DESC').limit(50)
  end

  def comment_weekly_order
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    posts = Post.includes(:commented_users)
                .sort do |a, b|
      b.commented_users.includes(:post_comments).where(created_at: from...to).size <=>
        a.commented_users.includes(:post_comments).where(created_at: from...to).size
    end
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(20)
    @tag_list = Tag.order('id DESC').limit(50)
  end

  def impressions_order
    posts = Post.order(impressions_count: 'DESC')
    @posts = posts.page(params[:page]).per(20)
    @tag_list = Tag.order('id DESC').limit(50)
  end

  def create_notification(current_user, user)
    # ↓ すでに「いいね」されているかwhereで探しに行かせます。
    past_notices = Notification.where(['sender_id = ? and recipenter_id = ? and post_id = ? and action = ?',
                                       current_user.id, user.id, id, 'favorite'])
    # ↓　blank?メソッドを使用すると、空の場合にtrueが返ります(RubyのメソッドではなくRailsに入っているActiveSupportのgemのメソッドらしいです)
    if past_notices.blank?
      # ↓ blanK?がtrueの場合のみ、通知作成を行います。(いいねボタン連打したりする人がいると通知がその分作成されて困るからです)
      notification = current_user.active_notifications.new(
        post_id: id,
        recipenter_id: end_user.id,
        action: 'favorite'
      )
      notification.save  # バリデーションが実行された結果エラーが無い場合trueを返し，エラーが発生した場合falseを返す
    end
  end

  private

 

  def post_params
    params.require(:post).permit(:title, :content, :status)
  end

  def correct_user
    @post=Post.find(params[:id])
    @user=@post.user
    # 今のユーザーがpostのユーザーと違うなら
    if current_user!=@user
      redirect_to posts_path
    end
  end

end
