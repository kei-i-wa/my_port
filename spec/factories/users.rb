FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 4) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 20) }
    join_year { '新入社員' }
    department_id { 1 }
    is_valid { true }
    password { 'password' }
    password_confirmation { 'password' }
  end
end