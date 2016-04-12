# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
