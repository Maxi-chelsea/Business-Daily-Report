class ItemComment < ApplicationRecord
  belongs_to :employee
  belongs_to :item
end
