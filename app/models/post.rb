class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  # バリデーション　データの入力なければfalseが返ってくる
  validates :title, presence: true,length:{maximum:60}
  validates :content, presence: true
  # コメント（ユーザーは複数コメントする）
  has_many :post_comments, dependent: :destroy
  # お気に入り（ユーザーは複数お気に入りする）
  has_many :favorites, dependent: :destroy
  # タグのリレーション
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  # いいね数順で並べる
  has_many :favorited_users, through: :favorites, source: :user
  # コメント数順で並べる
  has_many :commented_users, through: :post_comments, source: :user
  # 閲覧数のカウント
  is_impressionable counter_cashe: true

  # 同じ記事を複数回お気に入りするのはNG
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = tags.pluck(:name) unless tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      post_tags.new(user_id: user_id,tag_id: new_post_tag.id).save
    end
  end

  def self.search(search)
    
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%").or(Post.where('content LIKE(?)', "%#{search}%"))
  end

  # 過去7日間の投稿数表示
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2days_ago, -> { where(created_at: 2.days.ago.all_day) }
  scope :created_3days_ago, -> { where(created_at: 3.days.ago.all_day) }
  scope :created_4days_ago, -> { where(created_at: 4.days.ago.all_day) }
  scope :created_5days_ago, -> { where(created_at: 5.days.ago.all_day) }
  scope :created_6days_ago, -> { where(created_at: 6.days.ago.all_day) }

  # scope :created_this_1week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  # scope :created_this_week, -> { where(created_at: Time.zone.now.prev_week(:monday)..Time.zone.now.prev_week(:friday)) }

# 通知のアソシエーション
  has_many :notifications, dependent: :destroy
  has_many :points, dependent: :destroy
# 通知の作成
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      post_id: id,
      visited_id: user_id,
      action: 'post_comment'
    )
  
    notification.save if notification.valid?
  end
# ポイントの
  def point_by(current_user)
    point = current_user.active_points.new(
      post_id: id,
      getter_id: user_id
      )
    point.save if point.valid?

  end

end
