class Post < ApplicationRecord
  belongs_to:user
  # バリデーション　データの入力なければfalseが返ってくる
  validates :title, presence: true
  validates :content, presence: true
  # コメント（ユーザーは複数コメントする）
  has_many :post_comments, dependent: :destroy
   #お気に入り（ユーザーは複数お気に入りする）
  has_many :favorites,dependent: :destroy
  # タグのリレーション
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags
  # 同じ記事を複数回お気に入りするのはNG
   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
   end
  end

  def self.search(search)
  return Post.all unless search
  Post.where('title LIKE(?)', "%#{search}%").or(Post.where('content LIKE(?)', "%#{search}%"))
  end

end
