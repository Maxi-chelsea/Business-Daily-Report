# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Employee.create!(
  name: '上長太郎',
  email: 'admin@gmail.com',
  password: '11111111',
  is_deleted: false,
  admin: true
)

Employee.create!(
  name: '部下元',
  email: 'buka1@gmail.com',
  password: '22222222',
  is_deleted: false,
  admin: false
)

Employee.create!(
  name: '退社済',
  email: 'buka2@gmail.com',
  password: '33333333',
  is_deleted: true,
  admin: false
)
