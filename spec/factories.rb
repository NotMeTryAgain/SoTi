FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "michaelbluth#{n}@hotmail.com" }
    password "password"
  end
end
