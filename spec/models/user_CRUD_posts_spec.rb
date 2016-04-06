require 'rails_helper'

describe "posts model" do
  before(:each) do
    @title_one = Post.create(webseries_name: "EastWillyB", link_to_trailer: "https://www.youtube.com/watch?v=lMg2Fv-8FsM", description: "Willie Jr.’s got his work cut out for him.", link: "http://www.eastwillyb.com/")
    @title_two = Post.create(webseries_name: "Ylse: A Web Series", link_to_trailer: "https://www.youtube.com/watch?v=h205FN_fwWs", description: "The Funniest TV show not on television", link: "http://www.ylse.net")
    @title_three = Post.create(webseries_name: "Valley Meadows", link_to_trailer: "https://www.youtube.com/watch?v=TPoFCokBC5U", description: "Two dudes try to rap", link: "https://www.youtube.com/watch?v=q5R2Iy-5EUA")
  end

  feature "As a user, I want to add an item, So that others can review it" do

    scenario "User adds item successfully" do
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

    scenario "User adds item unsuccessfully" do
      visit '/'
      click_button('Post a Series')
      fill_in('Title', with: @title_one.webseries_name)
      fill_in('Link to Trailer', with: @title_one.link_to_trailer)
      fill_in('Description', with: @title_one.description)
      click_button('Submit')

      expect(page).to_not have_content('EastWillyB')
      expect(page).to_not have_content('Willie Jr.’s got his work cut out for him.')
    end

    scenario "User adds item unsuccessfully" do
      visit '/'
      click_button('Post a Series')
      fill_in('Link to Trailer', with: @title_one.link_to_trailer)
      fill_in('Description', with: @title_one.description)

      fill_in("Link to Webseries", with: @title_one.link)
      click_button('Submit')

      expect(page).to_not have_content('http://www.eastwillyb.com/')
      expect(page).to_not have_content('Willie Jr.’s got his work cut out for him.')
    end
  end

  feature "As a user, I want to view a list of items, So that I can pick items to review" do

    scenario "user sees list of items" do
      visit '/'
      expect(page).to have_content("EastWillyB")
      expect(page).to have_content("Ylse: A Web Series")
      expect(page).to have_content("Valley Meadows")
    end

    scenario "user sees detailed list of an item" do
      visit '/'
      click_link("Valley Meadows")
      expect(page).to have_content("Valley Meadows")
      expect(page).to have_content("Two dudes try to rap")
      expect(page).to have_content("https://www.youtube.com/watch?v=q5R2Iy-5EUA")
    end
  end

  feature "As a user, I want to update an item's information, So that I can correct errors or provide new information" do

    scenario "User successfully updates the link to the content" do
      visit '/'
      click_link('Ylse: A Web Series')
      click_on('Update')
      fill_in("post_link", with: "www.imdb.com/title/tt2261139")
      click_button('Submit')


      expect(page).to have_content("www.imdb.com/title/tt2261139")
    end

    scenario "User successfully updates the title to the content" do
      visit '/'
      click_link('Valley Meadows')
      click_on('Update')
      fill_in('Title', with: "Valley Meadows Web Show")
      click_button('Submit')

      expect(page).to have_content("Valley Meadows Web Show")
    end

    scenario "User successfully updates the description to the content" do
      visit '/'
      click_link('EastWillyB')
      click_on('Update')
      fill_in('Description', with: "Culture clash with a new generation, on the Eastside")
      click_on('Submit')

      expect(page).to have_content("Culture clash with a new generation, on the Eastside")
    end
  end

  feature "As a user, I want to delete an item, So that no one can review it" do

    scenario "User is the creator of the artwork and successfully deletes the artwork" do
      visit '/'
      click_link('Ylse: A Web Series')
      click_on('Delete')

      expect(page).to_not have_content('Ylse: A Web Series')
    end
  end
end
