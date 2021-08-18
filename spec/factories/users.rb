FactoryBot.define do
  factory :user do
    association :department
    name { Faker::Lorem.characters(number: 4) }
    email { Faker::Internet.email }
    # introduction { Faker::Lorem.characters(number: 20) }
    join_year { '新入社員' }
    department_id { 1 }
    password { 'password' }
    password_confirmation { 'password' }
  end
end