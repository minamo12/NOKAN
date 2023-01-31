FactoryBot.define do
  factory :small_category do
    association :medium_category
    user { medium_category.item }
    name { Faker::Lorem.small_test(number:5) }
  end
end