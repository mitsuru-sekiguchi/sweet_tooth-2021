FactoryBot.define do
  factory :sweet do
    association :user
    name       { Faker::Food.ingredient }
    price      { 300 }
    shop_info  { Faker::Restaurant.name }
    text       { Faker::Lorem.sentence }

    after(:build) do |sweet|
      sweet.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
