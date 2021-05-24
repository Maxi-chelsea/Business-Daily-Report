class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_deleted: { '有効': false, '退職': true }

  has_many :facilities
  has_many :items
  has_many :daily_reports
  has_many :daily_report_comments
  has_many :favorites, dependent: :destroy
  has_many :item_comments

  has_many :messages
  has_many :sent_messages, through: :messages, source: :receive_employee
  has_many :reverses_of_message, class_name: 'Message', foreign_key: 'receive_employee_id'
  has_many :received_messages, through: :reverses_of_message, source: :employee

end