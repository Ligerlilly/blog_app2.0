# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    image File.open(File.join(Rails.root, '/spec/fixtures/files/slipHit.jpg'))
    caption "MyText"
    entry_id 1
  end
end
