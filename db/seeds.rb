5.times do
  FactoryGirl.create(:user)
end

FactoryGirl.create(:user, username: "pablo-admin", role: "admin")

5.times do
  FactoryGirl.create(:post, user: User.first)
  FactoryGirl.create(:post_with_three_reviews)
end

Post.all.each do |post|
  20.times do
    FactoryGirl.create(:review, post: post)
  end
end
