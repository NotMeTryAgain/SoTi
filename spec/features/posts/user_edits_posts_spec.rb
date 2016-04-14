require 'rails_helper'

describe "User edits items" do
  let!(:post1) { FactoryGirl.create(:post) }

  feature "As a user, I want to update an item's information, So that I can correct errors or provide new information" do

    scenario "Creator of post can edit their post" do
      login_as_user(post1.user)
      click_on post1.webseries_name
      click_on('Update this Post')
      fill_in("Title", with: "Brand New")
      click_button('Submit')
      expect(page).to have_content("Brand New")
    end

    scenario "Unauthorized but logged in user cannot update a post" do
      user2 = FactoryGirl.create(:user)
      login_as_user(user2)
      click_on post1.webseries_name

      expect(page).to_not have_button("Update this Post")
    end
  end
end
