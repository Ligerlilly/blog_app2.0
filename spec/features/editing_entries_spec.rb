  require 'spec_helper'
  
  feature 'Editing entries' do
    
    before do
      FactoryGirl.create(:user, email: 'test@test.com', password: 'password', admin: true) 
      FactoryGirl.create(:user, email: 'test2@test.com', password: 'password') 
      FactoryGirl.create(:entry, title: 'Hi', content: 'There')
      visit '/'
      click_link 'blog'
    end

    scenario 'can edit an entry' do
      click_link 'Sign in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Edit'
      fill_in 'Title', with: "Editing"
      fill_in 'Content', with: 'Stuff'
      click_button 'Update Entry'
      expect(page).to have_content('Entry was successfully updated.')
      entry = Entry.find_by_title('Editing')
      expect(entry.content).to have_content 'Stuff'
    end 
    
    scenario "can't edit and entry" do
      click_link 'Sign in'
      fill_in 'Email', with: 'test2@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).not_to have_content('Edit')
      visit '/entries/1/edit'
      expect(page).to have_content('You must be an admin to do that.')
    end
  
  end
