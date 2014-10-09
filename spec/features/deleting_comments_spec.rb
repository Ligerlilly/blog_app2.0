  require 'spec_helper'
  include Devise::TestHelpers

  feature 'Creating comments' do
    before do
      FactoryGirl.create(:user, email: 'admin@test.com', password: 'password', username: 'k', admin: true) 
      FactoryGirl.create(:user, email: 'user@test.com', password: 'password', username: 'j') 
      FactoryGirl.create(:entry, title: 'Hi', content: 'There')
    end
    
    scenario 'comment creator can delete comments' do
      visit '/'
      click_link 'blog'
      click_link 'Sign in'
      fill_in 'Email', with: 'admin@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Comment'
      fill_in 'comment_content', with: 'interesting'
      click_button 'Create Comment'
      click_link 'x'
      expect(page).not_to have_content 'interesting'
    end
    
    scenario 'other users cannot delete comments' do
      visit '/'
      click_link 'blog'
      click_link 'Sign in'
      fill_in 'Email', with: 'admin@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Comment'
      fill_in 'comment_content', with: 'interesting'
      click_button 'Create Comment'
      click_link 'Logout'
      click_link 'blog'
      click_link 'Sign in'
      fill_in 'Email', with: 'user@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).not_to have_link 'x'
    end
    
    scenario 'admin can delete users comments' do
      visit '/'
      click_link 'blog'
      click_link 'Sign in'
      fill_in 'Email', with: 'user@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Comment'
      fill_in 'comment_content', with: 'user comments'
      click_button 'Create Comment'
      click_link 'Logout'
      click_link 'blog'
      click_link 'Sign in'
      fill_in 'Email', with: 'admin@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'x'
      expect(page).not_to have_content 'user comments'
    end
  end