require 'spec_helper'

describe Visa do

  let(:visa) { FactoryGirl.create(:visa) }
  let(:visa_information) { FactoryGirl.create(:visa_information) }

  subject { visa }
  it { should respond_to(:visa_type) }
  it { should respond_to(:visa_informations) }

  describe "when visa_type is not present" do
    before { visa.visa_type = " " }
    it { should_not be_valid }
  end
end