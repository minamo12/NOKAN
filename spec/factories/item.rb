FactoryBot.define do
  factory :item do
    association :large_category
    association :medium_category
    association :small_category
    name { Faker::Lorem.test_item(number:5) }
    information { Faker::Lorem.test_information(number:20) }
    commentary { Faker::Lorem.test_commentary(number:20) }
    reading { Faker::Lorem.test_reading(number:5) }
  end
end