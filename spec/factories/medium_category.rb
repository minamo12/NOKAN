FactoryBot.define do
  factory :medium_category do
    user { large_category.item }
    name { Faker::Lorem.medium_test }
  end
end