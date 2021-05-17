class DailyReport < ApplicationRecord
  has_many :daily_report_comments
  belongs_to :employee
  belongs_to :facility
  belongs_to :item
end
