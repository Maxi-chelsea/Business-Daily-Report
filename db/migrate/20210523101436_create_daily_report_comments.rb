class CreateDailyReportComments < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_report_comments do |t|
      t.integer :employee_id, null: false
      t.integer :daily_report_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
