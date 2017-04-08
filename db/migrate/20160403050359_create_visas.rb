class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :visa_type

      t.timestamps null: false
    end
  end
end
