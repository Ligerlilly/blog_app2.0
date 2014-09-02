class Entry < ActiveRecord::Base
  has_many :photos
  validates :title, presence: true
  validates :content, presence: true
  default_scope { order('entries.created_at DESC') }
end
