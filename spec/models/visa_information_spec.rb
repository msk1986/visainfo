require 'spec_helper'

describe VisaInformation do

  let(:country) { FactoryGirl.create(:country) }
  let(:visa) { FactoryGirl.create(:visa) }
  let(:visa_information) { FactoryGirl.create(:visa_information) }

  subject { visa_information }

  it { should respond_to(:country) }
  it { should respond_to(:visa) }

  describe "when country_id is not present" do
    before { visa_information.country_id = " " }
    it { should_not be_valid }
  end

  describe "when visa_id is not present" do
    before { visa_information.visa_id = " " }
    it { should_not be_valid }
  end

  describe "when visa_info is not present" do
    before { visa_information.visa_info = " " }
    it { should_not be_valid }
  end
end