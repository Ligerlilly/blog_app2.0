# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#  content          :text
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true 

  validates :user_id, presence: true
  validates :content, presence: true
  
end
