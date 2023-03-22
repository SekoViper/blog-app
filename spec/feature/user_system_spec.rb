require 'rails_helper'

RSpec.describe '', type: :system do
  it 'displays all users' do
    # display a page
    visit users_path

    # assert the displayed page
    assert_text 'Seko'

    # navigate to the show page
    sleep(1)
    click_link('Seko')

    # assert the displayed page
    sleep(1)
    assert_text 'Bio'
  end

  it 'displays the user with their posts' do
    # display all users
    visit users_path

    # assert the displayed page
    assert_text 'Seko'

    # click on a user from the displayed page
    sleep(1)
    click_link('Seko')

    # assert the displayed page has a post with text 'second' and 'Show'
    assert_text 'super'
    assert_text 'second'
    assert_text 'Show all posts'

    # click on a post from the list of posts
    sleep(1)
    # page.click_on 'first'
    first(:link_or_button, 'This is another post').click

    # assert the displayed page
    sleep(1)
    assert_text 'Seko'
  end

  it 'displays the index page of the post' do
    # display a all users
    visit users_path

    # assert the displayed page
    assert_text 'Seko'

    # click on a user from the displayed page
    sleep(1)
    click_on 'Seko'

    # navigate to posts path
    sleep(1)
    click_button 'Show all posts'
  end
end
