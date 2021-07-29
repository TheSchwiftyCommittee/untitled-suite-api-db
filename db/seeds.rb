# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "rick", email: "rick@test.com",  password: "morty", admin: true)
user = User.create(username: "nathan", email: "nathan@test.com", password: "123456", admin: false)
user = User.create(username: "raymond", email: "raymond@test.com",  password: "123456", admin: false)

list_item1 = List.create(title: "Daily workout", description: "It is Leg day", priority: "Important",  completed: false)
list_item2 = List.create(title: "Clean Car", description: "Its been weeks", priority: "Semi-Important",  completed: false)
list_item3 = List.create(title: "Cook dinner", description: "Kids will be home soon", priority: "Important",  completed: false)