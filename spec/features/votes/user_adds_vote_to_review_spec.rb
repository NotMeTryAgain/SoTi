require 'rails_helper'


feature "user can add vote to a review", js: true do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post) }
  let!(:review) { FactoryGirl.create(:review, post: post1) }

  scenario "an authorized user can add a vote to a review" do
    login_as_user(user1)
    click_on post1.webseries_name
    click_on "Upvote"

    expect(page).to have_content("Upvote: 1")
    expect(page).to have_content("Downvote: 0")
  end

  scenario "an unauthorized user cannot add a vote to a review" do
    visit root_path
    click_on post1.webseries_name
    click_on "Upvote"

    expect(page).to have_content("User must sign in to vote")
  end

  scenario "if an authorized user cannot add a second vote on the same review" do
    login_as_user(user1)
    click_on post1.webseries_name
    click_on "Upvote"
    click_on "Upvote"

    expect(page).to have_content("User cannot vote twice on the same review, but you can change your vote.")
  end

end
