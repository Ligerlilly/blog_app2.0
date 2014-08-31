require 'rails_helper'

RSpec.describe Entry, :type => :model do
  let(:entry) { FactoryGirl.create(:entry) }
  
  subject { entry }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should be_valid }
  
  describe "with blank title" do
    before { entry.title = "" }
    it { should_not be_valid }  
  end
end
