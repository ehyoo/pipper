# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

main_user = User.create(username: 'main_user', password: 'ayylmao1')
main_user.pips.create(body: 'This is the main user pip')

(2..6).each do |x|
  u = User.create(username: "user#{x}", password:'testtest1')
  u.pips.create(body: "This is user#{x} reporting!")
end

a = User.create(username: 'userfoo', password: 'userfoo1')
b = User.create(username: 'userbar', password: 'userbar1')
