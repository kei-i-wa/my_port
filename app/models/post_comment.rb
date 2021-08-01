class PostComment < ApplicationRecord
  # あるコメントに紐づくユーザーも記事も１
  belongs_to:user
  belongs_to:post
end
