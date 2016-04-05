require "rails_helper"

feature "user signs in" do
  scenario "with success" do
    visit "/users/sign_in"
    user = FactoryGirl.create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    # save_and_open_page
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_link "Sign Out"
  end

  scenario "fails" do
    visit "/users/sign_in"
    user = FactoryGirl.create(:user)

    fill_in "Email", with: user.email
    fill_in "Password", with: "hubbahubba"
    click_on "Log in"
    # save_and_open_page
    expect(page).to have_content "Invalid email or password."
    expect(page).to_not have_link "Sign Out"
  end

end
