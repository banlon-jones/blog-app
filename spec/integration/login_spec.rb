require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! name: 'jones', password: '123456', email: 'jones@gmail.com', post_counter: 0
    end
    it 'shows content' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      fill_in 'Email', with: 'Tekle@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Log in')
    end

    it 'Without fill email and password inputs' do
      visit new_user_session_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Log in')
    end

    it 'correct email and password inputs' do
      visit new_user_session_path
      fill_in 'Email', with: 'jones@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path root_path
    end
  end
end
