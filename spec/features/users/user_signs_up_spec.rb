require "rails_helper"
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

feature "user signs up for account with avatar" do
  scenario "successfully" do
    visit "/users/sign_up"

    fill_in "Username", with: "Sonic The Hedgehog"
    fill_in "Email", with: "sonic@hedgehog.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    attach_file 'user_avatar', File.join(Rails.root + 'app/assets/images/test_avatar.png')

    click_on "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
    within('div#user_avatar') do
      expect(page).to have_xpath('//img')
    end
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
