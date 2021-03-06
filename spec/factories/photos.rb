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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    image File.open(File.join(Rails.root, '/spec/fixtures/files/slipHit.jpg'))
    caption "MyText"
    photoable_id 1
  end
end
