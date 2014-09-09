   require 'spec_helper'
   
   feature "Uploading a photo" do
      before do
        FactoryGirl.create(:entry, title: 'Hi', content: 'There')
        visit '/'
        click_link 'blog'
      end
      
      scenario 'can upload and delete a photo' do
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
   end
