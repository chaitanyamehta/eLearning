# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Discipline.create(description: 'Computer Engineering')
Discipline.create(description: 'Computer Science')
Discipline.create(description: 'Electrical Engineering')
Discipline.create(description: 'Physics')
Discipline.create(description: 'Astronomy')
Discipline.create(description: 'Mathematics')
Discipline.create(description: 'Biology')
Discipline.create(description: 'Chemistry')
Discipline.create(description: 'Economics')

params = {name: "Administrator", user_auth_attributes: {email: "admin@admin.com", password: "admin", password_confirmation: "admin"}, phone_number: "919-999-9999", address: "NC State University, Raleigh, NC"}
Admin.create(params)