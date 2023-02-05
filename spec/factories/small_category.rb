FactoryBot.define do
  factory :small_category do
    user { medium_category.item }
    name { Faker::Lorem.small_test }
  end
end