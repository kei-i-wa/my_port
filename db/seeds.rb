# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.create!(
  id: 1,
  name: '未登録',
  correct_name: '未登録'
)

# User.create!(
#   name: '管理者',
#   email: 'admin@example.com',
#   password: 'adminadmin',
#   password_confirmation: 'adminadmin',
#   join_year: '新入社員',
#   department_id: 1,
#   admin: true
# )
