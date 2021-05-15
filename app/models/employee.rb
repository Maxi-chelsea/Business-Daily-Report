class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_deleted: { '有効': false, '退職': true }

  has_many :facilities
  has_many :daily_reports
  has_many :dairy_report_comments
  has_many :item_comments
  has_many :messeages

end