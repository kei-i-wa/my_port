class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  # グループは複数のユーザーを持つ。group_usersから参照可能
  has_many :users, through: :group_users, dependent: :destroy
  # グループオーナー表示のために
  belongs_to :user
  
  validates :name, presence: true
  validates :status, presence: true
  validates :introduction, presence: true
  
# グループ紹介は必須でなくても良い気がする
#   validates :introduction, presence: true
end
