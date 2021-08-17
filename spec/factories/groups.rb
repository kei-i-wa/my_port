FactoryBot.define do
  factory :group do
    association :user
    name { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 15) }
    status { Faker::Lorem.characters(number: 5) }
    
  end
end
