class DailyReport < ApplicationRecord
  has_many :daily_report_comments, dependent: :destroy
  belongs_to :employee
  belongs_to :facility
end
