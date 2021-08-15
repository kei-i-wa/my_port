class Department < ApplicationRecord
  # ユーザーが辞めたら、それに紐づく部署情報も消します。
  has_many :users, dependent: :destroy
  validates :name, presence: true,length:{maximum:8}
  validates :correct_name,presence: true,length:{maximum:15}
  def self.search(search)
    return Department.all unless search

    Department.where('name LIKE(?)', "%#{search}%").or(Department.where('correct_name LIKE(?)', "%#{search}%"))
  end
end
