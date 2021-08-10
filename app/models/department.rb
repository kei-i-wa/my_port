class Department < ApplicationRecord
  # ユーザーが辞めたら、それに紐づく部署情報も消します。
  has_many :users, dependent: :destroy

  def self.search(search)
    return Department.all unless search

    Department.where('name LIKE(?)', "%#{search}%").or(Department.where('correct_name LIKE(?)', "%#{search}%"))
  end
end
