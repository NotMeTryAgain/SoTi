require "rails_helper"

feature "authenticated user edits review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post) }

  scenario "successfully deletes their review" do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    click_on post.webseries_name
    choose "5"
    fill_in "Comments", with: "This show is amazing!!!!!!!"
    click_on "Add Review"
    click_on "Delete Review"

    expect(page).to have_content "Review deleted!"
    expect(page).to_not have_content "This show is amazing!!!!!!!"
    expect(page).to have_content "5"
  end

  scenario "signed in user can't see delete button of other users reviews" do
    post_with_reviews = FactoryGirl.create(:post_with_three_reviews)

    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    click_on post_with_reviews.webseries_name

    visit "/"
    click_on post_with_reviews.webseries_name
    expect(page).to_not have_content "Delete Review"
  end


  end
