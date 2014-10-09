  require 'spec_helper'

  feature 'Creating comments' do
   before do
      FactoryGirl.create(:user, email: 'user@test.com', password: 'password', username: 'k')  
      FactoryGirl.create(:entry, title: 'Hi', content: 'There')
      visit '/'
      click_link 'blog'
    end

    scenario 'can create comment' do
      click_link 'Sign in'
      fill_in 'Email', with: 'user@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Comment'
      fill_in 'comment_content', with: 'interesting'
      click_button 'Create Comment'
      expect(page).to have_content 'interesting'
      expect(page).to have_css('.user_names', text: 'k')
      expect(page).to  have_css("img[src$='eggTastic.jpg']")
    end
    
    scenario 'can close comment form' do
      click_link 'Sign in'
      fill_in 'Email', with: 'user@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Comment'
      page.find(".comment_closer").click
      expect(page).not_to have_css 'comment_form'
    end
    

  end
