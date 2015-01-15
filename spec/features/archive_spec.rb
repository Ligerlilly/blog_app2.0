require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Achive' do 
    let!(:user) { FactoryGirl.create(:user) }
    let!(:admin) { FactoryGirl.create(:admin) }
    
  	before do
      login_as(user, scope: :user)
		  visit '/'
		  click_link 'blog'
    end

    scenario 'users can not use archive' do
    	click_link 'Archive'
    	click_link('May', match: :first)
    	expect(page).to have_content('You must be an admin to do that.')
    end

    scenario 'admin can use archive' do
    	logout(user)
      login_as(admin, scope: :user)
      visit '/'
      click_link 'blog'
      click_link 'Archive'
      click_link('May', match: :first)
      expect(page).not_to have_content('You must be an admin to do that.')
    end

end