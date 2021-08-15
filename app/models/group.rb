class Group < ApplicationRecord
  has_many :group_users
  # グループは複数のユーザーを持つ。group_usersから参照可能
  has_many :users, through: :group_users, dependent: :destroy
  # グループオーナー表示のために
  belongs_to :user

  validates :name, presence: true,
                  length: {maximum:25}
  validates :status, presence: true,
                  length: {maximum:25}
  validates :introduction, presence: true,length: {maximum:4000}
  
  # 検索
  def self.search(search)
    return Group.all unless search

    Group.where('name LIKE(?)', "%#{search}%").or(Group.where('introduction LIKE(?)', "%#{search}%"))
         .or(Group.where('status LIKE(?)', "%#{search}%"))
  end
end
