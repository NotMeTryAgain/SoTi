require "rails_helper"

feature "user deletes account" do
  scenario "with success" do
    visit "/users/sign_in"
    user = FactoryGirl.create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Update Information"
    click_button "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully
    cancelled. We hope to see you again soon."

  end
end
