class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.integer :employee_id
      t.integer :genre_id
      t.integer :item_id
      t.string :name
      t.integer :postal_code
      t.string :address
      t.string :responsible_person

      t.timestamps
    end
  end
end
