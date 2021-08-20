class PostComment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  # あるコメントに紐づくユーザーも記事も１
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true, length: { maximum: 400 }
end
