# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user1 = User.create(username: "rick", email: "rick_morty@test.com",  password: "morty", admin: false, admin_director: true)
user2 = User.create(username: "nathan", email: "nathan@test.com", password: "nathan123", admin: true, admin_director: false)
# user3 = User.create(username: "raymond", email: "raymond@test.com",  password: "raymond123", admin: true, admin_director: false)
# user4 = User.create(username: "testuser1", email: "user1@test.com",  password: "password1", admin: false, admin_director: false)
# user5 = User.create(username: "testuser2", email: "user2@test.com",  password: "password2", admin: false, admin_director: false)
# user6 = User.create(username: "testuser3", email: "user3@test.com",  password: "password3", admin: false, admin_director: false)

nathans_profile = Profile.new(
    first_name: "Nathan",
    last_name: "Smith",
    user_id: user2.id)

    nathans_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_nathan.jpg'), filename: 'test_avatar_nathan.jpg', content_type: 'image/jpg')
    nathans_profile.save




















list_item1 = List.create(title: "Daily workout", description: "It is Leg day", priority: "Important",  completed: false)
list_item2 = List.create(title: "Clean Car", description: "Its been weeks", priority: "Semi-Important",  completed: false)
list_item3 = List.create(title: "Cook dinner", description: "Kids will be home soon", priority: "Important",  completed: false)