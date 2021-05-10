class Facilitie < ApplicationRecord
  belongs_to :employee
  has_many :items
  has_many :facility_genres
  has_many :daily_reports
end
