  require 'spec_helper'
  include Devise::TestHelpers
  
  feature 'Signing up' do
    scenario 'Successful sign up' do
      visit '/'
      click_link 'blog'
      click_link 'Sign in'
      within 'nav' do
        click_link 'Sign up'
      end
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("You have signed up successfully.")
    end
  end
