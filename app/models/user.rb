class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  # ユーザーは１つの部署に所属（現在の部署）
  belongs_to:department
  # ユーザーは複数投稿できる　ユーザー消えても記事は残したい
  has_many:posts
  # ユーザーは複数コメントできる ユーザー消えたらコメントも
  has_many:post_comments,dependent: :destroy
  # お気に入りのアソシエーション
  has_many :favorites, dependent: :destroy
  # グループのアソシエーション
  has_many:group_users,dependent: :destroy
  # group_usersは中間テーブル
  has_many:groups, through: :group_users,dependent: :destroy
  # グループオーナー表示のため
  has_many :owned_groups, class_name: "Group"

end
