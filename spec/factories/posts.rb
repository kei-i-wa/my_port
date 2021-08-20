FactoryBot.define do
  factory :post do
    association :user
    title { Faker::Lorem.characters(number: 5) }
    content { Faker::Lorem.characters(number: 20) }
  end
end
