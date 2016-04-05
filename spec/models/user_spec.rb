require 'rails_helper'

feature "As an user, I want to add an item, So that others can review it" do
  scenario "User adds item successfully" do
    visit '/'
    click_button('Post a Series')
    fill_in('Title') with: "EastWillyB"
    fill_in('Media Type') with: "Video"
    fill_in('Description') with: "Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar."
    fill_in('Link') with: "http://www.eastwillyb.com/"
    expect(page).to have_content('EastWillyB')
    expect(page).to have_content('Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.')
  end

  scenario "User adds item unsuccessfully" do
    visit '/'
    click_button('Post a Series')
    fill_in('Title') with: "EastWillyB"
    fill_in('Media Type') with: "Video"
    fill_in('Description') with: "Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar."

    expect(page).to_not have('EastWillyB')
    expect(page).to_not have('Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.')
  end

  scenario "User adds item unsuccessfully" do
    visit '/'
    click_button('Post a Series')
    fill_in('Media Type') with: "Video"
    fill_in('Description') with: "Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar."
    fill_in('Link') with: "http://www.eastwillyb.com/"

    expect(page).to_not have('http://www.eastwillyb.com/')
    expect(page).to_not have('Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.')
  end
end

feature "As an user, I want to view a list of items, So that I can pick items to review" do
  scenario "user sees list of items" do
    #add factorygirl items with title and link
    #add factorygirl items with title and link
    #add factorygirl items with title and link
    visit '/'
    expect(page).to have_content(#1st title)
    expect(page).to have_content(#2nd title)
    expect(page).to have_content(#3rd title)
  end

  scenario "user sees detailed list of an item" do
    #add factorygirl items with title and link
    #add factorygirl items with title and link
    #add factorygirl items with title and link
    visit '/'
    click_link('#1st title')
    expect(page).to have_content(#1st title)
    expect(page).to have_content(#1st title link)
  end
end

feature "As a user, I want to update an item's information, So that I can correct errors or provide new information" do
  scenario "User successfully updates the link to the content" do
    visit '/'
    click_link('#1st title')
    click_button('Update')
    fill_in('Link') with: "http://www.ylse.net"
    click_button('Save & Update')
    expect(page).to have_content("http://www.ylse.net")
  end

  scenario "User successfully updates the title to the content" do
    visit '/'
    click_link('#1st title')
    click_button('Update')
    fill_in('Title') with: "Ylse: A Web Series"
    click_button('Save & Update')
    expect(page).to have_content("Ylse: A Web Series")
  end

  scenario "User successfully updates the description to the content" do
    visit '/'
    click_link('#1st title')
    click_button('Update')
    fill_in('Description') with: "The Funniest TV show not on television"
    click_button('Save & Update')
    expect(page).to have_content("The Funniest TV show not on television")
  end
end

feature "As a user, I want to delete an item, So that no one can review it" do
  scenario "User is the creator of the artwork and successfully deletes the artwork" do
    visit '/'
    click_link('#1st title')
    click_button('Delete')

    expect(page).to_not have_content('#1st title')




    # fill_in "Email" with:
    # fill_in "Password" with:
    # fill_in "Password Confirmation" with:
    #go to the index page
    #click on the first item
    #user attempts to delete item
    #user successfully deletes item
    #user is redirected to index page that no longer contains item title
    #later we can write this test to perform a search query, that if passing, will no longer find the title.
  end

  pending "User who is not the creator of the item tries to delete it" do
    fill_in "Email" with:
    fill_in "Password" with:
    fill_in "Password Confirmation" with:
    #user that created item is different than logged in user!
    #goto index page
    #the first artwork is created by the user, the second artwork is created by another user
    #click on the second artwork
    #user attempts to delete the artwork
    #expect to see an error message and that the artwork is still there.
    #user stays on the page
  end
end
