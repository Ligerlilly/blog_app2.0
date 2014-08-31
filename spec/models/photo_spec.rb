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
