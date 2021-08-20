FactoryBot.define do
  factory :department do
    name { Faker::Lorem.characters(number: 4) }
    correct_name { Faker::Lorem.characters(number: 4) }
  end
end
