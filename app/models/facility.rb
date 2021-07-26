class Facility < ApplicationRecord
  belongs_to :employee
  has_many :items
  has_many :daily_reports

  # 緯度・軽度取得
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum is_closed: { '診療中': false, '閉院': true }

  enum genre: {
    '---': 0,
    public: 1,
    private: 2,
    other: 3
  }, _prefix: true

  def activ_item_titles
    items.where(status: [0, 1]).pluck(:title).join(' / ')
  end
end
