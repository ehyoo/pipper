# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

some_user = User.create(username: 'Rob Test')
other_user = User.create(username: 'Rob Test II')

some_user.pips.create(body: 'This is my first tweet!')
other_user.pips.create(body: 'This is also my first tweet!')
