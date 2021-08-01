class Post < ApplicationRecord
  belongs_to:user
  # バリデーション　データの入力なければfalseが返ってくる
  validates :title, presence: true
  validates :content, presence: true
  has_many :post_comments, dependent: :destroy
  
end
