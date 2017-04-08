# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

CSV.foreach('db/country.csv') do |row|
	for i in 0..(row.size-1)/2
		Country.create(:country_name => row[i*2], :area_id => row[i*2+1])
	end
end

CSV.foreach('db/visa.csv') do |row|
	for i in 0..row.size-1
		Visa.create(:visa_type => row[i])
	end
end

CSV.foreach('db/area.csv') do |row|
	for i in 0..row.size-1
		Area.create(:area_name => row[i])
	end
end