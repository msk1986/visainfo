class AddAreaIdToVisaInformations < ActiveRecord::Migration
  def change
    add_column :visa_informations, :area_id, :integer
  end
end
