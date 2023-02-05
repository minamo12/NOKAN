FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number:5) }
    information { Faker::Lorem.characters(number:5) }
    commentary { Faker::Lorem.characters(number:5) }
    reading { Faker::Lorem.characters(number:5) }
  end
end