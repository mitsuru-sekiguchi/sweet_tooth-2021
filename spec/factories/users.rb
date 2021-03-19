FactoryBot.define do
  factory :user do
    nickname              { 'ニックネーム' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa123' }
    password_confirmation { password }
  end
end
