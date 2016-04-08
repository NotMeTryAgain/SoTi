require 'rails_helper'
describe "posts model" do
  before(:each) do
    @title_one = Post.new(webseries_name: "EastWillyB", link_to_trailer: "https://www.youtube.com/watch?v=lMg2Fv-8FsM", description: "Willie Jr.’s got his work cut out for him.", link: "http://www.eastwillyb.com/")
    @title_two = Post.new(webseries_name: "Ylse: A Web Series", link_to_trailer: "https://www.youtube.com/watch?v=h205FN_fwWs", description: "The Funniest TV show not on television", link: "http://www.ylse.net")
    @title_three = Post.new(webseries_name: "Valley Meadows", link_to_trailer: "https://www.youtube.com/watch?v=TPoFCokBC5U", description: "Two dudes try to rap", link: "https://www.youtube.com/watch?v=q5R2Iy-5EUA")
  end

  feature "As a user, I want to add an item, So that others can review it" do
    scenario "User adds item successfully" do
      userone = FactoryGirl.create(:user)
      login_as_user(userone)
      visit '/'
      click_button('Post a Series')
      fill_in('Title', with: @title_one.webseries_name)
      fill_in('Link to Trailer', with: @title_one.link_to_trailer)
      fill_in('Description', with: @title_one.description)
      fill_in('Link to Webseries', with: @title_one.link)
      click_button('Submit')

      expect(page).to have_content('EastWillyB')
      expect(page).to have_content('Willie Jr.’s got his work cut out for him.')
    end

    scenario "User can't add post because link is blank, sees errors" do
      userone = FactoryGirl.create(:user)
      login_as_user(userone)
      visit '/'
      click_button('Post a Series')
      fill_in('Title', with: @title_one.webseries_name)
      fill_in('Link to Trailer', with: @title_one.link_to_trailer)
      fill_in('Description', with: @title_one.description)
      click_button('Submit')

      expect(page).to have_content("Link can't be blank")
      expect(page).to_not have_content('EastWillyB')
      expect(page).to_not have_content('Willie Jr.’s got his work cut out for him.')
    end

    scenario "User can't add post because name is blank, sees errors" do
      userone = FactoryGirl.create(:user)
      login_as_user(userone)
      visit '/'
      click_button('Post a Series')
      fill_in('Link to Trailer', with: @title_one.link_to_trailer)
      fill_in('Description', with: @title_one.description)
      fill_in("Link to Webseries", with: @title_one.link)
      click_button('Submit')

      expect(page).to have_content("Webseries name can't be blank")
      expect(page).to_not have_content('http://www.eastwillyb.com/')
      expect(page).to_not have_content('Willie Jr.’s got his work cut out for him.')
    end
  end
end
