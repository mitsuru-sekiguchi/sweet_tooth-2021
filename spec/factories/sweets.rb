FactoryBot.define do
  factory :sweet do
    association :user
    name       { 'pancake' }
    price      { 300 }
    shop_info  { 'pancakeshop' }
    text       { 'nice!' }

    after(:build) do |sweet|
      sweet.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
