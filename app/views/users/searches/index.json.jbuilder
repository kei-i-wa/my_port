json.array! @users do |user|
  　json.id user.id
  json.name user.name
  json.introduction user.introduction
  json.profile_image_id user.profile_image_id
  json.join_year user.join_year
  json.user_sign_in current_user
end
