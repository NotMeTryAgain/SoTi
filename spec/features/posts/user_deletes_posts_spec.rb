require "rails_helper"

describe "user destroys posts" do
  let!(:post1) { FactoryGirl.create(:post) }

  feature "As a user, I want to delete an item, So that no one can review it" do
    scenario "Creator of post can delete their post" do
      visit '/'
      login_as_user(post1.user)
      click_on post1.webseries_name
      # within('div#post_buttons') do
        click_button('Delete this Post')
      expect(page).to_not have_content post1.webseries_name
    end

    scenario "Unauthorized but logged in user cannot delete a post" do
      user2 = FactoryGirl.create(:user)
      login_as_user(user2)
      click_on post1.webseries_name

      # within('div#post_buttons') do
        expect(page).to_not have_button("Delete this Post")
    end
  end
end
