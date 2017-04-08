require 'spec_helper'

describe Country do

  let(:area) { FactoryGirl.create(:area) }
  let(:country) { FactoryGirl.create(:country) }
  let(:visa_information) { FactoryGirl.create(:visa_information) }
  let(:visa) { FactoryGirl.create(:visa) }

  before do
    # 適当なパラメーターを採取してメソッドのテストに利用
    @params = {
               "utf8"=>"✓",
               "authenticity_token"=>"UzCltjFP8fpwi2bojolgCWOR4qeghQ9qrJmh8Xd8u0NzUM8JKXjMvX02HIuG5+tRiw8P8IjH26cnuxGHHq9wNQ==",
               "a2"=>"true",
               "a3"=>"true",
               "a12"=>"true",
               "v1"=>"true",
               "v5"=>"true",
               "v6"=>"true",
               "commit"=>"検索",
               "controller"=>"areas",
               "action"=>"index"
              }
  end

  subject { country }

  it { should respond_to(:country_name) }
  it { should respond_to(:area) }
  # 7行目を:visa_infoに、こちらを:visa_infosにするとダメ
  it { should respond_to(:visa_informations) }

  describe "when country_name is not present" do
    before { country.country_name = " " }
    it { should_not be_valid }
  end

  describe "when area_id is not present" do
    before { country.area_id = " " }
    it { should_not be_valid }
  end

  describe "self.find_keys_from_params(@params)" do
    before do
      @result = Country.find_keys_from_params(@params)
    end
    it 'testing method' do
      expect(@result).to eq [:a, :a, :a, :v, :v, :v]
    end
  end

  describe "self.get_id_from_keys(@params)" do
    before do
      @result = Country.get_id_from_keys(@params)
    end
    it 'testing method' do
      expect(@result).to eq [2, 3, 12, 1, 5, 6]
    end
  end

  describe "self.create_query_hash(@params)" do
    before do
      @result = Country.create_query_hash(@params)
    end
    it 'testing method' do
    # これがなぜかSyntax Errorで通らない
    # got: {:a=>[2, 3, 12], :v=>[1, 5, 6]}
    # と出力されるのだが・・・
    # eqのあとに()でくくってあげるとパス
      expect(@result).to eq({:a=>[2, 3, 12], :v=>[1, 5, 6]})
    end
  end

  # country, area, visa, visa_informationのデータが必要
  describe "self.reply_countries(params)" do
    before do
      # @area_id_arr = [1,2]
      # 以下、factories.rbでcountry.country_nameを{ Faker::Name.name }とすると、
      # 結果のcountry_idのオーダーがランダムに変化してしまう
      # Country.create(id: 1, :country_name => "sample country1", :area_id => 2)
      # Country.create(id: 2, :country_name => "sample country2", :area_id => 3)
      # Country.create(id: 3, :country_name => "sample country3", :area_id => 12)
      # Country.create(id: 4, :country_name => "sample country4", :area_id => 12)
      FactoryGirl.create(:country, area_id: 2)
      FactoryGirl.create(:country, area_id: 3)
      FactoryGirl.create(:country, area_id: 12)
      FactoryGirl.create(:country, area_id: 12)
      # Visa.create(id: 1, :visa_type => "sample visa 1")
      # Visa.create(id: 5, :visa_type => "sample visa 5")
      # Visa.create(id: 6, :visa_type => "sample visa 6")
      FactoryGirl.create(:visa, id: 1)
      FactoryGirl.create(:visa, id: 5)
      FactoryGirl.create(:visa, id: 6)
      # VisaInformation.create(:visa_info => "info1", :country_id => 1, :visa_id =>1)
      # VisaInformation.create(:visa_info => "info2", :country_id => 2, :visa_id =>5)
      # VisaInformation.create(:visa_info => "info3", :country_id => 3, :visa_id =>6)
      # VisaInformation.create(:visa_info => "info4", :country_id => 4, :visa_id =>6)
      FactoryGirl.create(:visa_information, country_id: 1, visa_id: 1)
      FactoryGirl.create(:visa_information, country_id: 2, visa_id: 5)
      FactoryGirl.create(:visa_information, country_id: 3, visa_id: 6)
      FactoryGirl.create(:visa_information, country_id: 4, visa_id: 6)
      @result = Country.reply_countries(@params).pluck(:id)
    end
    it 'testing method' do
      expect(@result).to eq [1,2,3,4]
    end
  end
end
