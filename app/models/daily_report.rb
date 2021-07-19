class DailyReport < ApplicationRecord
  has_many :daily_report_comments, dependent: :destroy
  belongs_to :employee
  belongs_to :facility

  has_many :favorites, dependent: :destroy

  has_many :notifications, dependent: :destroy

  def favorited_by?(employee)
    favorites.where(employee_id: employee.id).exists?
  end

  validates :time, presence: true
  validates :person, presence: true
  validates :content, presence: true

  def create_notification_favorite!(current_employee)
    # すでに「いいね」されているか検索
    temp = Notification.where(['visitor_id = ? and visited_id = ? and daily_report_id = ? and action = ? ', current_employee.id, employee_id, id, 'favorite'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_employee.active_notifications.new(
        daily_report_id: id,
        visited_id: employee_id,
        action: 'favorite'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
