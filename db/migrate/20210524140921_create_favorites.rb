class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :employee_id
      t.integer :daily_report_id

      t.timestamps
    end
  end
end
