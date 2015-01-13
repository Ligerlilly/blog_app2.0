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

require 'rails_helper'

RSpec.describe Photo, :type => :model do
  let(:photo) { FactoryGirl.create(:photo) }
  
  subject { photo }
  
  it { should respond_to(:caption) }
  it { should respond_to(:image) }
  it { should be_valid }
  
  describe "file too big" do
    before { photo.image = File.open(File.join(Rails.root, '/spec/fixtures/files/riverWithT&A.jpg')) }
    it { should_not be_valid }
  end
  
  
end
