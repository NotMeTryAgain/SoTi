require 'rails_helper'

feature "As an user, I want to add an item, So that others can review it" do
  let title_one = Post.create(title: "EastWillyB", media_type: "Video", description: "Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.", link: "http://www.eastwillyb.com/")

  scenario "User adds item successfully" do
    visit '/'
    click_button('Post a Series')
    fill_in('Title') with: title_one.title
    fill_in('Media Type') with: title_one.media_type
    fill_in('Description') with: title_one.description
    fill_in('Link') with: title_one.link
    expect(page).to have_content('EastWillyB')
    expect(page).to have_content('Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.')
  end

  scenario "User adds item unsuccessfully" do
    visit '/'
    click_button('Post a Series')
    fill_in('Title') with: title_one.title
    fill_in('Media Type') with: title_one.media_type
    fill_in('Description') with: title_one.description

    expect(page).to_not have('EastWillyB')
    expect(page).to_not have('Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.')
  end

  scenario "User adds item unsuccessfully" do
    visit '/'
    click_button('Post a Series')
    fill_in('Media Type') with: title_one.media_type
    fill_in('Description') with: title_one.description
    fill_in('Link') with: title_one.link

    expect(page).to_not have('http://www.eastwillyb.com/')
    expect(page).to_not have('Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.')
  end
end

feature "As a user, I want to view a list of items, So that I can pick items to review" do
  let title_one = Post.create(title: "EastWillyB", media_type: "Video", description: "Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.", link: "http://www.eastwillyb.com/")
  let title_two = Post.create(title: "Ylse: A Web Series", media_type: "Video", description: "The Funniest TV show not on television", link: "http://www.ylse.net")
  let title_three = Post.create(title: "Valley Meadows", media_type: "Video", description: "Two dudes try to rap", link: "https://www.youtube.com/watch?v=q5R2Iy-5EUA")
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
    expect(page).to have_content("Video")
    expect(page).to have_content("Two dudes try to rap")
    expect(page).to have_content("https://www.youtube.com/watch?v=q5R2Iy-5EUA")
  end
end

feature "As a user, I want to update an item's information, So that I can correct errors or provide new information" do

  let title_one = Post.create(title: "EastWillyB", media_type: "Video", description: "Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.", link: "http://www.eastwillyb.com/")
  let title_two = Post.create(title: "Ylse: A Web Series", media_type: "Video", description: "The Funniest TV show not on television", link: "http://www.ylse.net")
  let title_three = Post.create(title: "Valley Meadows", media_type: "Video", description: "Two dudes try to rap", link: "https://www.youtube.com/watch?v=q5R2Iy-5EUA")

  scenario "User successfully updates the link to the content" do
    visit '/'
    click_link('Ylse: A Web Series')
    click_button('Update')
    fill_in('Link') with: "www.imdb.com/title/tt2261139"
    click_button('Save & Update')
    expect(page).to have_content("www.imdb.com/title/tt2261139/")
  end

  scenario "User successfully updates the title to the content" do
    visit '/'
    click_link('Valley Meadows')
    click_button('Update')
    fill_in('Title') with: "Valley Meadows Web Show"
    click_button('Save & Update')
    expect(page).to have_content("Valley Meadows Web Show")
  end

  scenario "User successfully updates the description to the content" do
    visit '/'
    click_link('EastWillyB')
    click_button('Update')
    fill_in('Description') with: "Culture clash with a new generation, on the Eastside"
    click_button('Save & Update')
    expect(page).to have_content("Culture clash with a new generation, on the Eastside")
  end
end

feature "As a user, I want to delete an item, So that no one can review it" do
  let title_one = Post.create(title: "EastWillyB", media_type: "Video", description: "Willie Jr.’s got his work cut out for him. Running Bushwick’s favorite Latino bar isn’t easy when the old timers retire, the new generation forgets their culture, and the hipsters start taking over the hood. As if it couldn’t get worse, Maggie, Willie Jr.’s ex-fiance, has taken up with Willie Jr.’s arch-nemesis, Albert, and is skillfully transforming Albert’s competing neighborhood bar into a moneymaker, as they cater to the whims of the new residents. Along with the help of his bar regulars, Willie Jr. tries to come up with a solution quickly, or risk losing the two loves of his life: Maggie and his sports bar.", link: "http://www.eastwillyb.com/")
  let title_two = Post.create(title: "Ylse: A Web Series", media_type: "Video", description: "The Funniest TV show not on television", link: "http://www.ylse.net")
  let title_three = Post.create(title: "Valley Meadows", media_type: "Video", description: "Two dudes try to rap", link: "https://www.youtube.com/watch?v=q5R2Iy-5EUA")

  scenario "User is the creator of the artwork and successfully deletes the artwork" do
    visit '/'
    click_link('Ylse: A Web Series')
    click_button('Delete')

    expect(page).to_not have_content('Ylse: A Web Series')




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
