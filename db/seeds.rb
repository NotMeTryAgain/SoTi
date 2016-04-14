5.times do
  FactoryGirl.create(:user, avatar: Faker::Avatar.image("my-own-slug", "50x50"))
end

FactoryGirl.create(:user, username: "pablo-admin", role: "admin")

5.times do
  FactoryGirl.create(:post, webseries_name: Faker::Hipster.sentence(3), user: User.first, description: Faker::Hipster.paragraph(2), link: "https://www.youtube.com/watch?v=YQHsXMglC9A", link_to_trailer: "https://www.youtube.com/watch?v=TkV-of_eN2w")
  FactoryGirl.create(:post_with_three_reviews, webseries_name: Faker::Hipster.sentence(3))
end

Post.all.each do |post|
  20.times do
    FactoryGirl.create(:review, post: post, body: Faker::Hipster.paragraph(2))
  end
end
