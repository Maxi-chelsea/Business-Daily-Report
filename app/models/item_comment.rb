class ItemComment < ApplicationRecord

  belongs_to :employee
  belongs_to :item

  has_many :notifications, dependent: :destroy

end
