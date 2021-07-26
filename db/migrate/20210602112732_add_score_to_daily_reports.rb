class AddScoreToDailyReports < ActiveRecord::Migration[5.2]
  def up
    add_column :daily_reports, :score, :decimal, precision: 5, scale: 3
  end
end
