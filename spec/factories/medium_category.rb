FactoryBot.define do
  factory :medium_category do
    association :large_category
    user { large_category.item }
    name { Faker::Lorem.medium_test(number:5) }
  end
end