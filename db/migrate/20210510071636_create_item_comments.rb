class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      t.integer :employee_id, null: false
      t.integer :item_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
