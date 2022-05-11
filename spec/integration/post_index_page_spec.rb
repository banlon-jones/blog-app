require 'rails_helper'

RSpec.describe 'user posts index', type: :feature do
  describe 'User' do
    before(:each) do
      @user = User.create! name: 'jones', password: 'jones2000', email: 'jones@gmail.com', post_counter: 0,
                           bio: 'testing'
      visit new_user_session_path
      fill_in 'Email', with: 'jones@gmail.com'
      fill_in 'Password', with: 'jones2000'
      click_button 'Log in'

      @user.posts.create(title: 'one', text: 'jones', author_id: @user.id, LikesCounter: 0)
      visit user_posts_path(@user)
    end

    it 'shows user photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the users username' do
      expect(page).to have_content('jones')
    end

    it 'shows posts title' do
      expect(page).to have_content('jones')
    end

    it 'can see some of the post\'s body.' do
      expect(page).to have_content 'jones'
    end
  end
end
