require 'rails_helper'

feature "user can delete vote to a review" do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post) }
  let!(:review) { FactoryGirl.create(:review, post: post1) }

  scenario "an authorized user can delete a vote to a review", js: true do
    login_as_user(user1)
    click_on post1.webseries_name
    click_on "Upvote"

    expect(page).to have_content("Upvotes: 1")
    expect(page).to have_content("Downvotes: 0")
    expect(page).to have_button("UnVote")

    click_on "UnVote"

    expect(page).to have_content("Upvotes: 0")
    expect(page).to have_content("Downvotes: 0")
    expect(page).to_not have_button("UnVote")

    click_on "Downvote"

    expect(page).to have_content("Upvotes: 0")
    expect(page).to have_content("Downvotes: 1")
    expect(page).to have_button("UnVote")

    click_on "UnVote"

    expect(page).to have_content("Upvotes: 0")
    expect(page).to have_content("Downvotes: 0")
    expect(page).to_not have_button("UnVote")
  end

  scenario "an unauthorized user cannot delete a vote to a review" do
    visit root_path
    click_on post1.webseries_name

    expect(page).to_not have_button("UnVote")
    expect(page).to have_content("Please sign in to vote on a review.")
  end
end
