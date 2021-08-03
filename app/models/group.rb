class Group < ApplicationRecord
  has_many :group_users
  # グループは複数のユーザーを持つ。group_usersから参照可能
  has_many :users, through: :group_users
  
  validates :name, presence: true
  validates :status, presence: true
  validates :introduction, presence: true
  
# グループ紹介は必須でなくても良い気がする
#   validates :introduction, presence: true
end
