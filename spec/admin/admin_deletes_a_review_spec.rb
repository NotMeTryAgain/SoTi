require 'rails_helper'

feature "admin deletes a review" do
  let!(:admin) { FactoryGirl.create(:user, username: "the_dude", role: "admin") }
  let!(:post1) { FactoryGirl.create(:post) }

  scenario "successfully deletes the review" do
    login_as(admin)
    visit root_path
    expect(page).to have_content(post1.webseries_name)

    click_link post1.webseries_name

    choose "5"
    fill_in "Comments", with: "This show is an outright nasty thing to say!!!!!!!"
    click_on "Submit Review"

    expect(page).to have_content(post1.webseries_name)
    expect(page).to have_content("5")
    expect(page).to have_content("This show is an outright nasty thing to say!!!!!!!")

    first(:button, "Delete Review").click

    expect(page).to_not have_content("This show is an outright nasty thing to say!!!!!!!")
    expect(page).to have_content("Review deleted!")
  end
end
