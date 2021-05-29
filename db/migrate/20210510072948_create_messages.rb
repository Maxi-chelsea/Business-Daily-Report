class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :employee, foreign_key: true
      t.references :receive_employee, foreign_key: { to_table: :employees }

      t.timestamps
    end
  end
end
