class Group < ApplicationRecord
  has_many :group_users
  # グループは複数のユーザーを持つ。group_usersから参照可能
  has_many :users, through: :group_users, dependent: :destroy
  # グループオーナー表示のために
  belongs_to :user

  validates :name, presence: true,
                   length: { in: 2..25 }
  validates :status, presence: true,
                     length: { in: 2..25 }
  validates :introduction, presence: true, length: { in: 2..1000 }

  # 検索
  def self.search(search)
    return all unless search

    where('name LIKE(?)', "%#{search}%").or(where('introduction LIKE(?)', "%#{search}%")).
      or(where('status LIKE(?)', "%#{search}%"))
  end
end
