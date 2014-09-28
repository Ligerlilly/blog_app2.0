# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  caption    :text
#  entry_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

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
