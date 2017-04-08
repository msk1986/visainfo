FactoryGirl.define do
  factory :area do
    area_name     "uncharted area"
  end

  factory :country do
    country_name  "uncharted country"
    # fakerを使う必要性ある？
    # fakerにすると、Country.reply_countries(params)のテストがうまくいかない
    # country_name  { Faker::Name.name }
    area_id       "uncharted area id"
    # area
  end

  factory :visa do
    visa_type     "uncharted visa type"
    # visa_type     { Faker::Name.name }
  end

  factory :visa_information do
    country_id    "uncharted country id"
    visa_id       "uncharted country visa id"
    visa_info     "uncharted country visa information"
  end

end