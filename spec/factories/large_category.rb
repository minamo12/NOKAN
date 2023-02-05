FactoryBot.define do
  factory :large_category do
    name { Faker::Lorem.characters(number:5) }
  end
end