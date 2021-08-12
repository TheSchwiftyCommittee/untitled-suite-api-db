require 'rails_helper'

#Test 1 
# Should pass when a valid user creates a task with a valid attributes.
user1 = User.create(username: "tom", email: "tom@test.com",  password: "tom123")
find_user_1 = User.find_by(username: "#{user1.username}") 

tom_list = List.new(
    title: "School Work",
    user_id: find_user_1.id)
tom_list.save

tom_task1 = Task.new(
    title: "Homework",
    description: "Dont move out of this chair till it is complete!",
    priority: "Critial",
    list_id: tom_list.id)
tom_task1.save

#Test 2
# Should pass when a valid user creates a task with that belongs to a invalid list.
user1 = User.create(username: "tom", email: "tom@test.com",  password: "tom123")
find_user_1 = User.find_by(username: "#{user1.username}") 

tom_list = List.new(
    user_id: find_user_1.id)
tom_list.save

tom_task2 = Task.new(
    title: "Homework",
    description: "Dont move out of this chair till it is complete!",
    priority: "Critial",
    list_id: tom_list.id)
tom_task2.save

#Test 3
# Should pass when a valid user creates a valid list with missing attribute(s).
user2 = User.create(username: "kate", email: "kate@test.com",  password: "kate123")
find_user_2 = User.find_by(username: "#{user2.username}") 

kate_list = List.new(
    title: "School Work",
    user_id: find_user_2.id)
kate_list.save

kate_task1 = Task.new(
    title: "Homework",
    description: "Dont move out of this chair till it is complete!",
    list_id: kate_list.id)
kate_task1.save

kate_task2= Task.new(
    title: "Homework",
    priority: "Critial",
    list_id: kate_list.id)
kate_task2.save

kate_task3= Task.new(
    description: "Dont move out of this chair till it is complete!",
    priority: "Critial",
    list_id: kate_list.id)
kate_task3.save

#Test 4
# Should pass when a valid user creates a task with a invalid title of over 30 characters.
user3 = User.create(username: "kelly", email: "kelly@test.com",  password: "kelly123")
find_user_3 = User.find_by(username: "#{user3.username}") 

kelly_list = List.new(
    title: "House Work",
    user_id: find_user_3.id)
kelly_list.save

kelly_task1 = Task.new(
    title: "Clean then bedrooms, bathrooms, make lunch, then go shopping, make sure the kids are picked u at 3pm.",
    description: "Complete before everyone gets home this evening!",
    priority: "Critial",
    list_id: kelly_list.id)
kelly_task1.save

#Test 5
# Should pass when a valid user creates a task with a invalid description of over 2000 characters.

kelly_task2 = Task.new(
    title: "Clean then House.",
    description: "Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday. 
    Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday.
    Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday.
    Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday.
    Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday.
    Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday.
    Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday.
    Complete before everyone gets home this evening, make sure to pick Thomas at 2:30pm, for baseball trining, and then pick up Nicole for swimming at 4pm after school. Take our chicken to defrost for tonights dinner, not forget to book the pup's vet appointment for Friday.",
    priority: "Critial",
    list_id: kelly_list.id)
kelly_task2.save

RSpec.describe Task, type: :model do
    
    it"is valid with complete valid attributes" do
      expect(tom_task1).to be_valid
    end

    it"is not valid with a invalid list attached" do
        expect(tom_task2).not_to be_valid
      end

    it"is not valid with incomplete or missing attributes" do
        expect(kate_task1).not_to be_valid
        expect(kate_task2).not_to be_valid
        expect(kate_task3).not_to be_valid
    end

    it"is not valid when title has more then 30 characters" do
        expect(kelly_task1).not_to be_valid
    end

    it"is not valid when description has more then 2000 characters" do
        expect(kelly_task2).not_to be_valid
    end
end
