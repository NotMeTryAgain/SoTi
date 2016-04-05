require "rails_helper"

feature "user signs out" do
  scenario "with success" do
    visit "/users/sign_in"
    user = FactoryGirl.create(:user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    # save_and_open_page
    click_on "Sign Out"

    expect(page).to have_content "Signed out successfully."
  end



end
