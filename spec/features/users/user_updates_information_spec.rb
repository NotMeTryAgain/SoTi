require "rails_helper"

feature "user updates information" do
  scenario "with success" do
    visit "/users/sign_in"
    user = FactoryGirl.create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Update Information"

    fill_in "Password", with: "awesomebeard"
    fill_in "Password confirmation", with: "awesomebeard"
    fill_in "Current password", with: user.password
    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario "fails" do
    visit "/users/sign_in"
    user = FactoryGirl.create(:user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Update Information"
    fill_in "Email", with: ""
    fill_in "Current password", with: user.password
    click_on "Update"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_link "Sign Out"
  end
  
end
