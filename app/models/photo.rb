require 'file_size_validator'
class Photo < ActiveRecord::Base
   belongs_to :entry
   mount_uploader :image, ImageUploader
    validates :image, 
    :presence => true, 
    :file_size => { 
      :maximum => 0.5.megabytes.to_i 
    }   
end
