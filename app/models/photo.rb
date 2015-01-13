# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  image          :string(255)
#  caption        :text
#  created_at     :datetime
#  updated_at     :datetime
#  photoable_id   :integer
#  photoable_type :string(255)
#

require 'file_size_validator'
class Photo < ActiveRecord::Base
   belongs_to :photoable, polymorphic: true
   mount_uploader :image, ImageUploader
    validates :image, 
    :presence => true, 
    :file_size => { 
      :maximum => 0.5.megabytes.to_i 
    }   
end
