require "rails_helper"

feature "authenticated user edits review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post) }

  scenario "successfully" do
    login_as_user(user)
    click_on post.webseries_name
    choose "5"
    fill_in "Comments", with: "This show is amazing!!!!!!!"
    click_on "Submit Review"
    click_on "Edit Review"
    fill_in "Comments", with: "This is so derivitive."
    click_on "Submit Review"

    expect(page).to_not have_content "This show is amazing!!!!!!!"
    expect(page).to have_content "This is so derivitive."
    expect(page).to have_content "Review Edited!"
    expect(page).to have_content "5"
  end

  scenario "not signed in user should not see edit button" do
    post_with_reviews = FactoryGirl.create(:post_with_three_reviews)
    visit "/"
    click_on post_with_reviews.webseries_name

    expect(page).to_not have_content "Edit Review"
  end
end
