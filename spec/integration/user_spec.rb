require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'jones', password: 'jones2000', email: 'jones@gmail.com', post_counter: 0
      @user2 = User.create! name: 'gilles', password: '123456', email: 'gilles@gmail.com', post_counter: 0
      visit new_user_session_path
      fill_in 'Email', with: 'jones@gmail.com'
      fill_in 'Password', with: 'jones2000'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of other users' do
      expect(page).to have_content('jones')
      expect(page).to have_content('gilles')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(8)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'show users page when clicked' do
      expect(page).to have_content('Number of posts: 0')
      click_on 'jones'
      expect(page).to have_current_path user_path(@user1)
    end
  end
end
