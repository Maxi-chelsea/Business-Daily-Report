class CreateDailyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_reports do |t|
      t.integer :employee_id
      t.integer :facility_id
      t.integer :comment_id
      t.datetime :time
      t.string :person
      t.text :content

      t.timestamps
    end
  end
end
