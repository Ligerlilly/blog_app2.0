# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  title      :text
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Entry < ActiveRecord::Base
  has_many :photos, as: :photoable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  default_scope { order( 'entries.created_at DESC' ) }
  #default_scope { where( created_at: Time.mktime(2014)..Time.now ) }
end
