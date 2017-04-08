class AddAreaIdToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :area_id, :integer
  end
end
