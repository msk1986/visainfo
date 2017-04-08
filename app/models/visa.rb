# == Schema Information
#
# Table name: visas
#
#  id         :integer          not null, primary key
#  visa_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visa < ActiveRecord::Base
	has_many :visa_informations
  validates :visa_type, presence: true

  # def self.reply_visa_type(visa_id)
  #   Visa.where(id: visa_id).pluck(:visa_type)
  # end
end
