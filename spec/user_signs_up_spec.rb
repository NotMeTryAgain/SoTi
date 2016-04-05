require "rails_helper"

feature "user signs up for account" do
  scenario "successfully" do
    visit "/users/sign_up"
    # user = FactoryGirl.create(:user)
    # binding.pry
    # save_and_open_page
    fill_in "Username", with: "Sonic The Hedgehog"
    fill_in "Email", with: "sonic@hedgehog.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "passwords don't match" do
    visit "/users/sign_up"

    fill_in "Username", with: "Sonic The Hedgehog"
    fill_in "Email", with: "sonic@hedgehog.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notpassword"
    click_on "Sign up"

    expect(page).to have_content "Password confirmation doesn't match Password"
  end

end
