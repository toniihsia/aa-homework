# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Kitten.create!(name: 'Jiro', house_id: 2)
Kitten.create!(name: 'Lulu', house_id: 3)
Kitten.create!(name: 'Tonia', house_id: 2)
Kitten.create!(name: 'Lawrence', house_id: 4)

House.create!(house_num: 1335, street_name: 'Marlin Avenue')
House.create!(house_num: 0000, street_name: 'Ally')
House.create!(house_num: 683, street_name: 'Brannan')
