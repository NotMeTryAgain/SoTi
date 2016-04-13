require "rails_helper"

feature "user views reviews of a web-series" do
  let!(:post) { FactoryGirl.create(:post_with_three_reviews) }

  scenario "views the reviews" do
    visit "/"
    click_on post.webseries_name

    expect(page).to have_content(post.reviews.first.body)
  end

  scenario "only sees 10 most recent reviews" do
    post1 = FactoryGirl.create(:post_with_twenty_reviews)

    visit '/'
    click_on post1.webseries_name

    expect(page).to_not have_content(post1.reviews.first.body)

    click_on "Next"

    expect(page).to_not have_content(post1.reviews.last.body)
    expect(page).to have_content(post1.reviews.first.body)
  end
end
