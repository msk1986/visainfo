class VisaInformation < ActiveRecord::Base
	belongs_to :country
	belongs_to :visa

  validates :country_id, presence: true
  validates :visa_id, presence: true
  validates :visa_info, presence: true

  delegate :country_name, to: :country
  delegate :visa_type, to: :visa

  # def country_name
  #   country.country_name
  # end

  # def visa_type
  #   visa.visa_type
  # end
end
