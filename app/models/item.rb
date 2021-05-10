class Item < ApplicationRecord
  belongs_to :facilitie
  has_many :daily_reports
  has_many :item_comments
end
