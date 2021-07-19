class Message < ApplicationRecord
  belongs_to :employee
  belongs_to :receive_employee, class_name: 'Employee'
end
