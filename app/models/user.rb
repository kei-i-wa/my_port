class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :department_id, presence: true

  attachment :profile_image
  # ユーザーは１つの部署に所属（現在の部署）
  belongs_to :department
  # ユーザーは複数投稿できる　ユーザー消えても記事は残したい
  has_many :posts, dependent: :destroy
  # ユーザーは複数コメントできる ユーザー消えたらコメントも
  has_many :post_comments, dependent: :destroy
  # お気に入りのアソシエーション
  has_many :favorites, dependent: :destroy
  # グループのアソシエーション
  has_many :group_users, dependent: :destroy
  # group_usersは中間テーブル
  has_many :groups, through: :group_users, dependent: :destroy
  # グループオーナー表示のため
  has_many :owned_groups, class_name: 'Group', dependent: :destroy

  def self.search(search)
    return User.all unless search

    User.where('name LIKE(?)', "%#{search}%")
        .or(User.where('introduction LIKE ?', "%#{search}%"))
        .or(User.where(department_id: search)).or(User.where(join_year: search))
  end

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
end
