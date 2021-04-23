FactoryBot.define do
  factory :comment do
    association :user
    association :sweet
    text {Faker::Lorem.sentence}
  end
end
