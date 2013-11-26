# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
OperatingSystem.create(name: 'Windows 8.1')
OperatingSystem.create(name: 'Mac 10.8.3')
OperatingSystem.create(name: 'Ubuntu 12.04')
user = User.where(emp_id: 'anujjam').first_or_create
user.role = 'admin'
user.save!
