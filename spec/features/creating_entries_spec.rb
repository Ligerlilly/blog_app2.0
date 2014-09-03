  require 'spec_helper'
  
  feature 'Creating entries' do
    before do
      visit '/'
      click_link 'blog'
    end

    scenario 'can create a entry' do
      click_link 'New entry'
      fill_in 'Title', with: 'Test'
      fill_in 'Content', with: 'Phase one'
      click_button 'Create Entry'
      expect(page).to have_content('Entry has been created.')
    
      entry = Entry.find_by_title('Test')
      expect(page.current_path) == entry_path(entry)
    end
  end
