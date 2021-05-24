class Favorite < ApplicationRecord

  belongs_to :employee
  belongs_to :daily_report

end
