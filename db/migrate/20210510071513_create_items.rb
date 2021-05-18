class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :employee_id, null: false
      t.integer :facility_id, null: false
      t.string :title, null: false
      t.boolean :genre, null: false
      t.integer :status, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
