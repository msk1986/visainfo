# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  area_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < ActiveRecord::Base
	has_many :countries
  validates :area_name, presence: true
end