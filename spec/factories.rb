FactoryGirl.define do
  factory :video do
    link "MyString"
    title "MyString"
    author "MyString"
    duration "MyString"
  end
  factory :user do
    sequence(:email) { |n| "michaelbluth#{n}@hotmail.com" }
    password "password"
    sequence(:username) { |n| "nbluth#{n}" }
  end

  factory :post do
    sequence(:webseries_name) { |n| "Nana Goes to Prison#{n}" }
    link_to_trailer "https://www.youtube.com/watch?v=qVsNy032N6A"
    description "being a hipster in brooklyn"
    link "https://www.youtube.com/channel/UCdwPnEk9AlUK5g6iDP0cYyA?nohtml5=False"
    user

    factory :post_with_three_reviews do
      after(:create) do |post|
        3.times { FactoryGirl.create(:review, post: post) }
      end
    end

    factory :post_with_twenty_reviews do
      after(:create) do |post|
        20.times { FactoryGirl.create(:review, post: post) }
      end
    end
  end

  factory :review do
    rating "5"
    sequence(:body) { |n| "Best thing I've ever laid eyes upon#{n}." }
    user
  end
end
