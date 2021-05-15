class CreateDairyReportComments < ActiveRecord::Migration[5.2]
  def change
    create_table :dairy_report_comments do |t|
      t.integer :dairy_report_id, null: false
      t.integer :employee_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
