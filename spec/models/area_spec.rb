require 'spec_helper'

describe Area do

  let(:area) { FactoryGirl.create(:area) }
  let(:country) { FactoryGirl.create(:country) }

  subject { area }
  it { should respond_to(:area_name) }
  # "country"はダメ
  # it { should respond_to(:country) }
  it { should respond_to(:countries) }
  it { should be_valid }

  describe "when area_name is not present" do
    before { area.area_name = " " }
    it { should_not be_valid }
  end
end