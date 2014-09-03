  require 'spec_helper'
  
  feature 'Editing entries' do
    before do
      FactoryGirl.create(:entry, title: 'Hi', content: 'There')
      visit '/'
      click_link 'blog'
    end

    scenario 'can edit an entry' do
      click_link 'Edit'
      fill_in 'Title', with: "Editing"
      fill_in 'Content', with: 'Stuff'
      click_button 'Update Entry'
      expect(page).to have_content('Entry was successfully updated.')
      entry = Entry.find_by_title('Editing')
      expect(entry.content).to have_content 'Stuff'
    end

  end
