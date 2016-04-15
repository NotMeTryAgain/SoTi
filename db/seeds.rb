require 'factory_girl_rails'

20.times do |i|
  User.create(username: Faker::Internet.user_name, email: i.to_s + Faker::Internet.email, password: "password")
end

User.create(username: "pablo", role: "admin", email: "pablo@honeybear.com", password: "password")

20.times do
  Post.create(webseries_name: Faker::Hipster.sentence(3), user: User.first, description: Faker::Hipster.paragraph(2), link: "https://www.youtube.com/embed/qVsNy032N6A")
  Post.create(webseries_name: Faker::Hipster.sentence(3), user: User.last, description: Faker::Hipster.paragraph(2), link: "https://www.youtube.com/embed/qVsNy032N6A")
end

Post.all.each do |post|
  20.times do
    User.all.each do |user|
      Review.create(post: post, body: Faker::Hipster.paragraph(2), rating: (rand(4) + 1), user: user)
    end
  end
end
