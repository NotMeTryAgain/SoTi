require "rails_helper"

feature "user views reviews of a web-series" do
  let!(:post) { FactoryGirl.create(:post_with_three_reviews) }

  scenario "views the reviews" do
    visit "/"
    click_on post.webseries_name

    expect(page).to have_content(post.reviews.first.body)
  end
end
