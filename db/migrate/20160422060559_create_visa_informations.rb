class CreateVisaInformations < ActiveRecord::Migration
  def change
    create_table :visa_informations do |t|
      t.integer :country_id
      t.integer :visa_id
      t.string :visa_info

      t.timestamps null: false
    end
  end
end
