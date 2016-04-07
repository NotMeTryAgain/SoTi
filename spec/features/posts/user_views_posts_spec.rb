require 'rails_helper'
describe "user views items" do
  feature "As a user, I want to view a list of items, So that I can pick items to review" do
    let!(:post1) { FactoryGirl.create(:post) }
    let!(:post2) { FactoryGirl.create(:post) }
    let!(:post3) { FactoryGirl.create(:post) }

    scenario "user sees list of items" do
      visit '/'

      expect(page).to have_content post1.webseries_name
      expect(page).to have_content post2.webseries_name
      expect(page).to have_content post3.webseries_name
    end

    scenario "user sees detailed list of an item" do
      visit '/'
      click_on post1.webseries_name

      expect(page).to have_content post1.webseries_name
      expect(page).to have_content post1.description
      expect(page).to have_content post1.link
    end
  end
end
