class Event < ApplicationRecord

  belongs_to :employee, dependent: :destroy

end
