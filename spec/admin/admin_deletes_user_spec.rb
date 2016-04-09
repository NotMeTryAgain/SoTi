require 'rails_helper'

feature "admin deletes a user" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, username: "the_dude", role: "admin") }

  scenario "successfully deletes the user" do
      login_as(admin)
      visit admin_users_path

      expect(page).to have_content(user1.username)
      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.username)
      expect(page).to have_content(user2.email)

      first(:button, "Delete User").click

      expect(current_path).to eq admin_users_path
      expect(page).to_not have_content(user1.username)
      expect(page).to_not have_content(user1.email)
      expect(page).to have_content("User is no more!")
  end
end
