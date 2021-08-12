require 'rails_helper'

#Test 1 
# Should pass with a valid user creates a list with a valid title.
user1 = User.create(username: "tom", email: "tom@test.com",  password: "tom123")
find_user_1 = User.find_by(username: "#{user1.username}") 

tom_list = List.new(
    title: "School Work",
    user_id: find_user_1.id)
tom_list.save

#Test 2
# Should pass with a valid user creates a list with a missing title.
user2 = User.create(username: "kate", email: "kate@test.com",  password: "kate123")
find_user_2 = User.find_by(username: "#{user2.username}") 

kate_list = List.new(
    user_id: find_user_1.id)
kate_list.save

#Test 3
# Should pass when a invalid user creates a list with a valid title.
kane_list = List.new(
    title: "Clean my room")
kane_list.save

#Test 4
# Should pass when a valid user creates a list with a invalid title of over 30 characters.
user4= User.create(username: "sam", email: "sam@test.com",  password: "sam123")
find_user_4 = User.find_by(username: "#{user4.username}") 

sam_list = List.new(
    title: "Work on school stuff, house work, job, and take the dogs out for a walk.",
    user_id: find_user_4.id)
sam_list.save

RSpec.describe List, type: :model do
    
    it"is valid with complete valid attributes" do
      expect(tom_list).to be_valid
    end

    it"is not valid with missing attributes" do
        expect(kate_list).not_to be_valid
    end

    it"is not valid when created by invalid/non-existent user" do
        expect(kane_list).not_to be_valid
    end

    it"is not valid when title has more then 30 characters" do
        expect(sam_list).not_to be_valid
    end
end
