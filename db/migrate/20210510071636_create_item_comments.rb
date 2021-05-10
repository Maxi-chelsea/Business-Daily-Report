class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      t.integer :employee_id
      t.text :comment

      t.timestamps
    end
  end
end
