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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    title "MyText"
    content "MyText"
  end
end
