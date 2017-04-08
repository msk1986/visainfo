require 'spec_helper'

describe "CountriesPages" do
  before do
    FactoryGirl.create(:area, area_name: "sample area 1", id: 1)
    FactoryGirl.create(:country, id: 1, country_name: "sample country 1", area_id: 1)
    FactoryGirl.create(:visa, id: 1)
    FactoryGirl.create(:visa_information, country_id: 1, visa_id: 1)
  end
  subject { page }

  describe "countries/show" do
    before do
      visit country_path(1)
    end
    it { should have_content('sample country 1') }
    it { should have_content('uncharted visa type') }
    it { should have_content('uncharted country visa information') }
  end

  describe "countries/search" do
    before do
      visit countries_search_path(1)
    end
    it { should have_content('sample country 1') }
    it { should have_content('uncharted visa type') }
    it { should have_content('uncharted country visa information') }
  end
end
