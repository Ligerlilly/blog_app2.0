  require 'spec_helper'
  include Warden::Test::Helpers
  Warden.test_mode!

  feature 'Admin' do 
    let!(:user) { FactoryGirl.create(:user) }
    let!(:admin) { FactoryGirl.create(:admin) }

  	before do
      login_as(user, scope: :user)
		  visit '/'
		  click_link 'blog'
    end

    scenario 'users can not access admin' do
    	expect(page).not_to have_content 'Admin'
    	visit '/admin'
    	expect(page).to have_content "You must be an admin to do that."
    end

    scenario 'admin users can make other users admin' do
      logout(user)
      login_as(admin, scope: :user)
      visit '/'
      click_link 'blog'
      click_link 'Admin'
      click_link 'Users'
    	find(:css, "#user_ids_[value='1']").set(true)
      click_button "edit checked"
      find(:css, "#users_1_admin[value='1']").set(true)
      click_button 'Update'
    	expect(User.find_by_id(1).admin?).to eq(true)
      expect(User.find_by_id(2).admin?).to eq(true)
    end

  end
