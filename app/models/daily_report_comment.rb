class DailyReportComment < ApplicationRecord
  belongs_to :employee
  belongs_to :daily_report, dependent: :destroy

  has_many :notifications, dependent: :destroy
end
