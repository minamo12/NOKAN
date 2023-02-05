FactoryBot.define do
  factory :medium_category do
    name { Faker::Lorem.characters(number:5) }
  end
end