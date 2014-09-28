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
  
  describe "with blank content" do
    before { entry.content = "" }
    it { should_not be_valid }  
  end
end
