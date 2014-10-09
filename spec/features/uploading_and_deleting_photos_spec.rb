   require 'spec_helper'
   
   feature "Uploading a photo" do
      before do
        FactoryGirl.create(:user, email: 'test@test.com', password: 'password', username: 'admin', admin: true) 
        FactoryGirl.create(:user, email: 'test2@test.com', password: 'password', username: 'b') 
        FactoryGirl.create(:entry, title: 'Hi', content: 'There')
        visit '/'
        click_link 'blog'
      end
      
      scenario 'admin can upload and delete a photo' do
        click_link 'Sign in'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        click_link 'Edit'
        click_link 'Add photo'
        fill_in 'Caption', with: "Test"
        attach_file('photo_image', '/home/user/public_html/images/blueBelt.jpg')
        click_button 'Create Photo'
        photo = Photo.last
        expect(page).to  have_css("img[src$='blueBelt.jpg']")
        click_link 'Delete'
        expect(page).not_to  have_css("img[src$='blueBelt.jpg']")
      end
      
      scenario "can't upload with out attaching a file" do
        click_link 'Sign in'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        click_link 'Edit'
        click_link "Add photo"
        click_button "Create Photo"
        expect(page).to have_content("Image can't be blank")
      end
      
      scenario "can't upload photo unless admin" do
        click_link 'Sign in'
        fill_in 'Email', with: 'test2@test.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        expect(page).not_to have_content('Edit')
        visit 'entries/1/photos/new'
        expect(page).to have_content("You must be an admin to do that.")
      end
   end
