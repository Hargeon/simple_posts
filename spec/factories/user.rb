FactoryBot.define do
  factory :user do
    name { 'Test Capybara' }
    password { '0123456789' }
    gender { 'male' }
    age { 20 }

    sequence(:email) { |n| "test#{n}@gmail.com" }
  end
end
