class Item < ApplicationRecord
  belongs_to :facility
  belongs_to :employee
  has_many :item_comments, dependent: :destroy

  enum genre: { '新規': true, '既存': false }

  enum status: { '未定': 0, '進行中': 1, '実績確認': 2, '失注': 3 }

end
