class Facility < ApplicationRecord
  belongs_to :employee
  has_many :facility_genres
  has_many :items
  has_many :daily_reports

  enum genre: {
    '---': 0,
    public: 1,
    private: 2,
    other: 3
  }, _prefix: true
end
