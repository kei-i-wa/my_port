class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿を持つ　それは、post_tagsを通じて参照できる
  has_many :posts, through: :post_tags
  # タグは複数のユーザーを持つ
  has_many :users, through: :post_tags

  validates :name,length:{maximum:8}
end
