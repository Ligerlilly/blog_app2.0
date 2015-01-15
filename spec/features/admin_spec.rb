  require 'spec_helper'
  include Warden::Test::Helpers
  Warden.test_mode!

  feature 'Admin' do 
    let!(:user) { FactoryGirl.create(:user) }
    let!(:admin) { FactoryGirl.create(:admin) }
    let!(:entry) { FactoryGirl.create(:entry) }


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

    scenario 'admins can ban users and when banned user comments are deleted' do
      click_link "Comment"
      fill_in "comment_content", with: 'hi there'
      click_button 'Create Comment'
      expect(page).to have_content 'hi there'
      expect(page).to have_css('.user_names', text: 'user')
      expect(page).to  have_css("img[src$='eggTastic.jpg']")
      logout(user)
      login_as(admin, scope: :user)
      visit '/'
      click_link 'blog'
      click_link 'Admin'
      click_link 'Users'
      find(:css, "#user_ids_[value='3']").set(true)
      click_button "edit checked"
      find(:css, "#users_3_banned").set(true)
      click_button 'Update'
      click_link 'Blog'
      expect(page).not_to have_content 'hi there'
      expect(page).not_to have_css('.user_names', text: 'user')
      expect(page).not_to have_css("img[src$='eggTastic.jpg']")
      click_link 'Logout'
      click_link 'Sign in'
      fill_in 'Email', with: user.email.to_s
      fill_in 'Password', with: 'password'
      click_button 'Log in' 
      expect(page).to have_content "You have been banned"
    end

    scenario 'admin users can make other users admin' do
      logout(user)
      login_as(admin, scope: :user)
      visit '/'
      click_link 'blog'
      click_link 'Admin'
      click_link 'Users'
    	find(:css, "#user_ids_[value='5']").set(true)
      click_button "edit checked"
      find(:css, "#users_5_admin[value='1']").set(true)
      click_button 'Update'
    	expect(User.find_by_id(5).admin?).to eq(true)
      expect(User.find_by_id(6).admin?).to eq(true)
    end

    scenario 'admin can veiw all users comments' do
      logout(user)
      login_as(admin, scope: :user)
      visit '/'
      click_link 'blog'
      click_link 'Admin'
      click_link 'Comments'
      expect(page).to have_content(Comment.last)
    end

    scenario 'admin can search users' do
      logout(user)
      login_as(admin, scope: :user)
      visit '/'
      click_link 'blog'
      click_link 'Admin'
      click_link 'Users'
      expect(page).to have_content(user.email)
      expect(page).to have_content(admin.email)
      fill_in 'q_username_cont', with: user.username.to_s
      click_button 'search'
      expect(page).to have_content(user.email)
      expect(page).not_to have_content(admin.email)
    end



  end
