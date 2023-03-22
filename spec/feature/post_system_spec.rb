require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'creates a post for a user' do
    it 'displays the post created' do
      # display a page
      visit users_path

      # assert the displayed page
      assert_text 'Seko'

      # navigate to the new post template
      click_on 'Seko'
      sleep(2)
      click_on('create_post')

      # fill the form with text
      sleep(1)
      fill_in 'post[title]', with: 'My first post'
      fill_in 'post[text]', with: 'This is another post'
      sleep(1)
      click_on('Add post')

      # use pagination
      sleep(1)
      click_on('Next')

      # assert the displayed page
      assert_text 'This is another post'
      assert_text 'This is another post'
      assert_text 'Comments: 0'
      assert_text 'Prev'

      # select a post
      sleep(1)
      first(:link_or_button, 'This is another post').click

      # add a comment
      sleep(1)
      first(:link_or_button, 'Add comment').click
      sleep(1)
      fill_in 'comment[text]', with: 'I like your post, thanks for sharing!'

      # assert the displayed page
      sleep(1)
      click_on('Add comment')
      # assert_text 'Comment saved successfully'
    end
  end

  describe 'displays detailed page of a single post' do
    it 'displays a single post' do
      # navigate to the posts page
      visit users_path

      # assert the displayed page
      assert_text 'Seko'

      sleep(1)
      click_on 'Seko'

      sleep(1)
      click_button 'Show all posts'

      sleep(1)
      find(:link, 'This is another post', match: :first).click

      # assert the displayed page
      assert_text 'Katie'

      # add a comment
      sleep(1)
      find(:link, 'Add comment', match: :first).click
      sleep(1)
      fill_in 'comment[text]', with: 'My pleasure Katie!'
      sleep(1)

      # assert the displayed page
      click_on('Add comment')
    end
  end
end
