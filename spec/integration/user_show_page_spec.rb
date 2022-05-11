require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'jones', password: 'jones2000', email: 'jones@gmail.com', post_counter: 0, bio: "testing"
      visit new_user_session_path
      fill_in 'Email', with: 'jones@gmail.com'
      fill_in 'Password', with: 'jones2000'
      click_button 'Log in'
      @user1.posts.create(title: 'one', text: 'hello1', author_id: @user1.id, LikesCounter: 0)
      @user1.posts.create(title: 'two', text: 'hello2', author_id: @user1.id, LikesCounter: 0)
      @user1.posts.create(title: 'three', text: 'hello3', author_id: @user1.id, LikesCounter: 0)
      visit user_path(@user1.id)
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the username' do
      expect(page).to have_content('jones')
    end

    it 'shows number of posts for each user' do
      user = User.first
      expect(page).to have_content(user.post_counter)
    end

    it 'shows the users bio' do
      expect(page).to have_content('testing')
    end

    it 'Should see the user\'s first 3 posts.' do
      expect(page).to have_content 'one'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_content('Show all post')
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_on 'Show all post'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
