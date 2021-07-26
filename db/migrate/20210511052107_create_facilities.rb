class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.integer :employee_id, null: false
      t.string :name, null: false
      t.string :postalcode, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.string :responsible_person, null: false
      t.boolean :is_closed, null: false, default: false
      t.integer :genre, null: false

      t.timestamps
    end
  end
end
