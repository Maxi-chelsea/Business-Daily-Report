class Item < ApplicationRecord
  belongs_to :facility
  has_many :daily_reports
  has_many :item_comments

  enum genre: { '新規': true, '既存': false }

  enum status: { '未定': 0, '進行中': 1, '実績確認': 2, '失注': 3 }

end
