FactoryBot.define do
  factory :large_category do
    name { Faker::Lorem.large_test(number:5) }
  end
end