class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :department_id, presence: true
  validates :introduction, length:{maximum:800}
  # refile使用時の記述
  attachment :profile_image
  # ユーザーは１つの部署に所属（現在の部署）
  belongs_to :department
  # ユーザーは複数投稿できる
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
  # タグのアソシエーション、中間テーブル
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags
  # 検索用　名前、自己紹介、部署、クラスで検索可能
  def self.search(search)
    return User.all unless search
    User.where('name LIKE(?)', "%#{search}%")
        .or(User.where('introduction LIKE ?', "%#{search}%"))
        .or(User.where(department_id: search)).or(User.where(join_year: search))
  end
# 通知　コメントする側、される側（通知受ける側）で２通り
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
# ポイント　ポイント与える側、もらう側で２通り
  has_many :active_points, class_name: 'Point', foreign_key: 'giver_id', dependent: :destroy
  has_many :passive_points, class_name: 'Point', foreign_key: 'getter_id', dependent: :destroy
  
  
   
end
