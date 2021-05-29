class CreateDailyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_reports do |t|
      t.integer :employee_id, null: false
      t.integer :facility_id, null: false
      t.string :title, null: false
      t.datetime :time, null: false
      t.string :person, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
