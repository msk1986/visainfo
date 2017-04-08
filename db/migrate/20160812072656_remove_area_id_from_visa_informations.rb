class RemoveAreaIdFromVisaInformations < ActiveRecord::Migration
  def change
    remove_column :visa_informations, :area_id
  end
end
