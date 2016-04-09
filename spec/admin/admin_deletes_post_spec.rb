require 'rails_helper'

feature "admin deletes a post" do
  let!(:admin) { FactoryGirl.create(:user, username: "the_dude", role: "admin") }
  let!(:post1) { FactoryGirl.create(:post) }
  let!(:post2) { FactoryGirl.create(:post) }

  scenario "successfully deletes the post" do
      login_as(admin)
      visit root_path

      expect(page).to have_content(post1.webseries_name)
      expect(page).to have_content(post2.webseries_name)

      first(:button, "Delete Post").click

      expect(current_path).to eq posts_path
      expect(page).to_not have_content(post1.webseries_name)
      expect(page).to have_content("Post deleted!")
  end
end
