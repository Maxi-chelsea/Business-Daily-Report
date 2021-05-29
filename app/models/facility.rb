class Facility < ApplicationRecord
  belongs_to :employee
  has_many :items
  has_many :daily_reports

  include JpPrefecture
  jp_prefecture :prefecture_code, method_name: :pref

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  enum is_closed: { '診療中': false, '閉院': true }

  enum genre: {
    '---': 0,
    public: 1,
    private: 2,
    other: 3
  }, _prefix: true

  def activ_item_titles
    items.where(status: [0, 1]).pluck(:title).join(" / ")
  end



end
