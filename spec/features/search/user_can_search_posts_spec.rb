require "rails_helper"

feature "user can search webseries by the webseries name" do
  let!(:post1) { FactoryGirl.create(:post_with_three_reviews) }
  let!(:post2) { FactoryGirl.create(:post_with_three_reviews) }
  let!(:post3) { FactoryGirl.create(:post_with_three_reviews, webseries_name: "Pop-pop goes to prison") }

  scenario "user sees a list of webseries that match their search query" do
    visit '/'
    # save_and_open_page
    fill_in "search", with: 'Nana'
    click_on "Search"

    expect(page).to have_content post1.webseries_name
    expect(page).to have_content post2.webseries_name
    expect(page).to_not have_content post3.webseries_name
  end

end
