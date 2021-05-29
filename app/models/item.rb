class Item < ApplicationRecord
  belongs_to :facility
  belongs_to :employee
  has_many :item_comments, dependent: :destroy

  enum genre: { '新規': true, '既存': false }

  enum status: { '未定': 0, '進行中': 1, '実績確認': 2, '失注': 3 }

  def create_notification_comment!(current_employee, item_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Item.select(:employee_id).where(id: item_id).where.not(employee_id: current_employee.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_employee, item_id, temp_id['employee_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_employee, item_id, employee_id) if temp_ids.blank?
  end
  
  def save_notification_comment!(current_employee, item_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      item_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
