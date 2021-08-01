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
end
