require "rails_helper"

# As an administrator of SoTi
# I want to see a list of users and their email addresses
# So that I can view who is using my website.

feature "admin sees list of users" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: "admin") }

  scenario "admin visits users index" do
    login_as(admin)
    visit '/admin/users'
    save_and_open_page

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
  end
end
