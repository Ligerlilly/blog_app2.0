  require 'spec_helper'
  include Devise::TestHelpers

  feature 'Signing in' do
    before do
      FactoryGirl.create(:user, email: 'test@test.com', password: 'password')
    end
    
    scenario 'Signing in via form' do
      visit '/'
      click_link 'blog'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
