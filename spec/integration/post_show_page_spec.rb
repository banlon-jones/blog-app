require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'jones', password: 'jones2000', email: 'jones@gmail.com', post_counter: 0, bio: "testing"
      visit new_user_session_path
      fill_in 'Email', with: 'jones@gmail.com'
      fill_in 'Password', with: 'jones2000'
      click_button 'Log in'
      @post = @user1.posts.create(title: 'one', text: 'hello1', author_id: @user1.id, LikesCounter: 0)
      visit user_post_path(@user1.id, 1)
    end

    it 'shows the post title' do
      expect(page).to have_content('one')
    end

    it 'Should see the post title.' do
      expect(page).to have_content 'one'
    end

    it 'Can see a button that lets me like post' do
      expect(page).to have_content('New Comment')
    end

  end
end
