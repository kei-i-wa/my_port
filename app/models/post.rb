class Post < ApplicationRecord
  belongs_to:user
  # バリデーション　データの入力なければfalseが返ってくる
  validates :title, presence: true
  validates :content, presence: true
  # コメント（ユーザーは複数コメントする）
  has_many :post_comments, dependent: :destroy
   #お気に入り（ユーザーは複数お気に入りする）
  has_many :favorites,dependent: :destroy
  
  # 同じ記事を複数回お気に入りするのはNG
   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end
end
