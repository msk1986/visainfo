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

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
