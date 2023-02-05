FactoryBot.define do
  factory :item do
    name { Faker::Lorem.test_item }
    information { Faker::Lorem.test_information }
    commentary { Faker::Lorem.test_commentary }
    reading { Faker::Lorem.test_reading }
  end
end