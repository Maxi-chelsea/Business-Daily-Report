# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Employee.create!(
  company_name: 'おためし株式会社',
  company_code: '111111',
  name: '上長太郎',
  email: 'admin@gmail.com',
  password: '11111111',
  is_deleted: "有効",
  admin: true
)

Employee.create!(
  company_name: 'おためし株式会社',
  company_code: '111111',
  name: '部下元',
  email: 'buka1@gmail.com',
  password: '22222222',
  is_deleted: "有効",
  admin: false
)

Employee.create!(
  company_name: 'おためし株式会社',
  company_code: '111111',
  name: '部下二郎',
  email: 'buka2@gmail.com',
  password: '33333333',
  is_deleted: "有効",
  admin: false
)

Employee.create!(
  company_name: 'おためし株式会社',
  company_code: '111111',
  name: '退社済',
  email: 'buka3@gmail.com',
  password: '44444444',
  is_deleted: "退職",
  admin: false
)

Employee.create!(
  company_name: 'テスト株式会社',
  company_code: '222222',
  name: 'サンプル太郎',
  email: 'admin2@gmail.com',
  password: '55555555',
  is_deleted: "有効",
  admin: true
)

Employee.create!(
  company_name: 'テスト株式会社',
  company_code: '222222',
  name: '部下三郎',
  email: 'buka4@gmail.com',
  password: '66666666',
  is_deleted: "有効",
  admin: false
)


