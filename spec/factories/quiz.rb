FactoryBot.define do
  factory :quiz do
    question { Faker::Lorem.characters(number:5) }
    correct_answer { Faker::Lorem.characters(number:5) }
  end
end