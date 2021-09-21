# This will guess the User class
FactoryBot.define do
  factory :user do
    full_name { 'Full Name' }
    sequence(:email) { |n| "johnemail#{n}@email.com" }
    password { '12341234' }
  end
end
