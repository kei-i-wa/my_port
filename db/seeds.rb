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

Department.create!(
  id: 2,
  name: '退職',
  correct_name: '退職済'
)

Department.create!(
  id: 3,
  name: '総務部',
  correct_name: '総務部'
)

Department.create!(
  id: 4,
  name: '研修生',
  correct_name: 'オペレーション'
)

User.create!(
  name: '管理者',
  email: 'admin@example.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin',
  join_year: '新入社員',
  department_id: 1,
  admin: true
)