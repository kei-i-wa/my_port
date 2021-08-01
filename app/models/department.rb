class Department < ApplicationRecord
  # ユーザーが辞めたら、それに紐づく部署情報も消します。
  has_many:users,dependent: :destroy
end
