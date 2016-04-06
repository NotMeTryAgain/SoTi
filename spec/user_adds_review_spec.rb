require "rails_helper"

feature "authenticated user adds review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) = { FactoryGirl.create(:post) }

  scenario "successfully" do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    click_on post.webseries_name
    choose "5"
    fill_in "Comments", with: "This show is amazing!!!!!!!"
    click_on "Add Review"

    expect(page).to have_content(user.username)
    expect(page).to have_content(post.webseries_name)
    expect(page).to have_content("This show is amazing!!!!!!!")
    expect(page).to have_content("5")

  end

  scenario "unsuccessfully because they are not signed in" do

    click_on post.webseries_name
    choose "5"
    fill_in "Comments", with: "This show is amazing!!!!!!!"
    click_on "Add Review"


    expect(page).to have_content("Please sign in to leave a review!")
  end

  scenario "does not add rating, review not added" do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    click_on post.webseries_name
    fill_in "Comments", with: "This show is amazing!!!!!!!"
    click_on "Add Review"


    expect(page).to have_content("Please select a rating")
  end

  scenario "does not provide a comment, review not added" do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    click_on post.webseries_name
    choose "5"
    click_on "Add Review"


    expect(page).to have_content("Please provide some words!")
  end


end
