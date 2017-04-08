# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  country_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  area_id      :integer
#

class Country < ActiveRecord::Base
	has_many :visa_informations
  belongs_to :area
  validates :country_name, presence: true
  validates :area_id, presence: true

  def self.find_keys_from_params(params)
    params.keys[2..-4].map { |i| i[0].to_sym }
  end

  def self.get_id_from_keys(params)
    params.keys[2..-4].map { |i| i[1..-1].to_i }
  end

  def self.create_query_hash(params)
    result = { a: [], v: [] }
    Country.find_keys_from_params(params).each_with_index do |i, index|
      result[i] << Country.get_id_from_keys(params)[index]
    end
    result
  end

  def self.reply_countries(params)
    result = ""
    area_id_arr = Country.create_query_hash(params)[:a]
    visa_id_arr = Country.create_query_hash(params)[:v]
    country_id = VisaInformation.where(visa_id: visa_id_arr).includes(:country).map(&:country)
    if area_id_arr.any? && visa_id_arr.any?
      result = Country.where(id: country_id, area_id: area_id_arr).order(country_name: :asc)
    elsif area_id_arr.any? && visa_id_arr.empty?
      result = Country.where(area_id: area_id_arr).order(country_name: :asc)
    else
      result = Country.where(id: country_id).order(country_name: :asc)
    end
    result

    # 以下、変更案
    # param = Country.create_query_hash(params)
    # countries = { visas: [], areas: [] }
    # countries[:visas] = VisaInformation.where(visa_id: param[:visas]).includes(:country).map(&:country) if param[:visas].present?
    # countries[:areas] = Country.where(area_id: param[:areas]) if param[:areas].present?

    # if countries[:areas].any? && countries[:visas].any?
    #   result = countries[:areas] & countries[:visas]
    # elsif countries[:areas].empty? && countries[:visas].empty?
    #   result = []
    # else
    #   result = countries[:areas].any? ? countries[:areas] : countries[:visas]
    # end

  end
end
