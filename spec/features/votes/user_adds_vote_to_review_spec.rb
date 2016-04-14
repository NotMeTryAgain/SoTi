require 'rails_helper'

feature "user can add vote to a review" do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post) }
  let!(:review) { FactoryGirl.create(:review, post: post1) }

  scenario "an authorized user can add a vote to a review", js: true do
    login_as_user(user1)

    click_on post1.webseries_name
    click_on "Upvote"
    
    expect(page).to have_content("Upvotes: 1")
    expect(page).to have_content("Downvotes: 0")
  end

  scenario "an unauthorized user cannot add a vote to a review" do
    visit root_path
    click_on post1.webseries_name

    expect(page).to_not have_button("Upvote")
    expect(page).to have_content("Please sign in to vote on a review.")
  end

  scenario "if an authorized user cannot add a second vote on the same review", js: true do
    login_as_user(user1)
    click_on post1.webseries_name
    click_on "Upvote"

    expect(page).to have_content("Upvotes: 1")

    click_on "Upvote"

    expect(page).to have_content("Upvotes: 1")

    click_on "Downvote"

    expect(page).to have_content("Downvotes: 1")

    click_on "Downvote"

    expect(page).to have_content("Downvotes: 1")
  end
end
