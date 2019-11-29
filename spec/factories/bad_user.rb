FactoryBot.define do
  factory :bad_user do
    name { 'Test Capybara' }
    email { 'test@@admin.com' }
    password { '0123456789' }
    gender { 'male' }
    age { 20 }
  end
end
