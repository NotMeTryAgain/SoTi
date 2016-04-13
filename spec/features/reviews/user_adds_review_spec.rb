require "rails_helper"

feature "authenticated user adds review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post) }

  scenario "logged in user can successfully add a review" do
    ActionMailer::Base.deliveries.clear
    login_as_user(user)
    click_on post.webseries_name
    choose "5"
    fill_in "Comments", with: "This show is amazing!!!!!!!"
    click_on "Submit Review"

    expect(page).to have_content(user.username)
    expect(page).to have_content(post.webseries_name)
    expect(page).to have_content("This show is amazing!!!!!!!")
    expect(page).to have_content("5")
    expect(page).to have_content("Review has been successfully created!")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "unsuccessfully because they are not signed in" do
    visit "/"
    click_on post.webseries_name

    expect(page).to have_content("Please sign in to write a review.")
  end

  scenario "does not add rating, review not saved" do
    login_as_user(user)
    click_on post.webseries_name
    fill_in "Comments", with: "This show is amazing!!!!!!!"
    click_on "Submit Review"

    expect(page).to have_content("Rating must be provided!")
    expect(page).to_not have_content("This show is amazing!!!!!!!")
  end


end
