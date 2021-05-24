class DailyReport < ApplicationRecord
  has_many :daily_report_comments, dependent: :destroy
  belongs_to :employee
  belongs_to :facility

  has_many :favorites, dependent: :destroy

  def favorited_by?(employee)
    favorites.where(employee_id: employee.id).exists?
  end

  validates :time, presence: true
  validates :person, presence: true
  validates :content, presence: true

end
