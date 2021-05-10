class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :employee_id
      t.integer :receive_employee_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
