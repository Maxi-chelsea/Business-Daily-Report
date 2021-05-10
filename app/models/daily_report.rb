class DailyReport < ApplicationRecord
  has_many :daily_report_comments
  belongs_to :employees
  belongs_to :facilitie
  belongs_to :item
end
