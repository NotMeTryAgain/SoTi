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

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)

  end

  scenario "unauthorized users are redirected" do
    login_as(user1)
    visit '/admin/users'
    expect(page).to have_content('not authorized')
    expect(current_path).to eq(root_path)
  end
end
