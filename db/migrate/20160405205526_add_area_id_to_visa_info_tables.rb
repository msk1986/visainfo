class AddAreaIdToVisaInfoTables < ActiveRecord::Migration
  def change
    add_column :visa_info_tables, :area_id, :integer
  end
end
