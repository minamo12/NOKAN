FactoryBot.define do
  factory :small_category do
    name { Faker::Lorem.characters(number:5) }
  end
end