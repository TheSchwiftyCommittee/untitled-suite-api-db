# Users/Admins
user1 = User.create(username: "rick", email: "rick@test.com",  password: "rick123", admin: false, admin_director: true)
user2 = User.create(username: "nathan", email: "nathan@test.com", password: "nathan123", admin: true, admin_director: false)
user3 = User.create(username: "raymond", email: "raymond@test.com",  password: "raymond123", admin: true, admin_director: false)
user4 = User.create(username: "morty", email: "morty@test.com",  password: "morty123", admin: false, admin_director: false)
user5 = User.create(username: "summer", email: "summer@test.com",  password: "summer123", admin: false, admin_director: false)
user6 = User.create(username: "jerry", email: "jerry@test.com",  password: "jerry123", admin: false, admin_director: false)

# Profiles
ricks_profile = Profile.new(
    first_name: "Rick",
    last_name: "Sanchez",
    user_id: user1.id)

ricks_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_rick.jpg'), filename: 'test_avatar_rick.jpg', content_type: 'image/jpg')
ricks_profile.save

nathans_profile = Profile.new(
    first_name: "Nathan",
    last_name: "Smith",
    user_id: user2.id)

nathans_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_nathan.jpg'), filename: 'test_avatar_nathan.jpg', content_type: 'image/jpg')
nathans_profile.save

rays_profile = Profile.new(
    first_name: "Ray",
    last_name: "Smith",
    user_id: user3.id)

rays_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_ray.jpg'), filename: 'test_avatar_ray.jpg', content_type: 'image/jpg')
rays_profile.save

mortys_profile = Profile.new(
    first_name: "Morty",
    last_name: "Smith",
    user_id: user4.id)
        
mortys_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_morty.jpg'), filename: 'test_avatar_morty.jpg', content_type: 'image/jpg')
mortys_profile.save

summers_profile = Profile.new(
    first_name: "Summer",
    last_name: "Smith",
    user_id: user5.id)

summers_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_summer.jpg'), filename: 'test_avatar_summer.jpg', content_type: 'image/jpg')
summers_profile.save

jerrys_profile = Profile.new(
    first_name: "Jerry",
    last_name: "Smith",
    user_id: user6.id)

jerrys_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_jerry.jpg'), filename: 'test_avatar_jerry.jpg', content_type: 'image/jpg')
jerrys_profile.save

# Lists & Tasks
morty_list1 = List.new(
    title: "School Work",
    user_id: user4.id)
morty_list1.save

morty_task1 = Task.new(
    title: "Homework",
    description: "Dont move till It is complete!",
    priority: "High",
    list_id: morty_list1.id)
morty_task1.save

morty_task2 = Task.new(
    title: "Start my assessment task",
    description: "Start it before half-year break",
    priority: "High",
    list_id: morty_list1.id)
morty_task2.save

morty_list2 = List.new(
    title: "House Work",
    user_id: user4.id)
morty_list2.save

morty_task3 = Task.new(
    title: "Clean my room",
    description: "Do it before the weekend",
    priority: "Low",
    list_id: morty_list2.id)
morty_task3.save

morty_task4 = Task.new(
    title: "Wash my cloths",
    description: "Do it before tonight",
    priority: "High",
    list_id: morty_list2.id)
morty_task4.save

morty_list3 = List.new(
    title: "Why I cant stand Morty",
    user_id: user4.id)
morty_list3.save

morty_list4 = List.new(
    title: "Finish the Back-end",
    user_id: user4.id)
morty_list4.save
    
summer_list1 = List.new(
    title: "School Work",
    user_id: user5.id)
summer_list1.save

summer_task1 = Task.new(
    title: "Do maths",
    description: "all questions before tomorrows class",
    priority: "High",
    list_id: summer_list1.id)
summer_task1.save

summer_task2 = Task.new(
    title: "Study for Friday's exam",
    description: "Cover all chpaters",
    priority: "High",
    list_id: summer_list1.id)
summer_task2.save
    
summer_list2 = List.new(
    title: "House Work",
    user_id: user5.id)
summer_list2.save

summer_list3 = List.new(
    title: "Shopping List",
    user_id: user5.id)
summer_list3.save
    
jerry_list1 = List.new(
    title: "House Work",
    user_id: user6.id)
jerry_list1.save

jerry_list2 = List.new(
    title: "Find a Job",
    user_id: user6.id)
jerry_list2.save

jerry_list3 = List.new(
    title: "Shopping List",
    user_id: user6.id)
jerry_list3.save
