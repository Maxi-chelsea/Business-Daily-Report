class CreateDairyReportComments < ActiveRecord::Migration[5.2]
  def change
    create_table :dairy_report_comments do |t|
      t.integer :dairy_report_id
      t.integer :employee_id
      t.text :comment

      t.timestamps
    end
  end
end
