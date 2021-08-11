require 'rails_helper'

user1 = User.create(username: "Tom", email: "Tom@test.com",  password: "Tom123")
find_user_1 = User.find_by(username: "#{user1.username}") 

user2 = User.create(username: "Kate", email: "Kate@test.com",  password: "Kate123")
find_user_2  = User.find_by(username: "#{user2.username}") 

user3 = User.create(username: "Ben", email: "Ben@test.com",  password: "Ben123")
find_user_3 = User.find_by(username: "#{user3.username}") 

user4 = User.create(username: "Kane", password: "Kane123")
user5 = User.create(username: "Kane", email: "Kane@test.com")
user6 = User.create(email: "Kane@test.com", password: "Kane123")



RSpec.describe User, type: :model do

    it"is valid with complete valid attributes" do
      expect(find_user_1).to be_valid
      expect(find_user_2).to be_valid
      expect(find_user_3).to be_valid
    end

    it"is not valid with incomplete valid attributes" do
      expect(user2).not_to be_valid
      expect(user3).not_to be_valid
      expect(user4).not_to be_valid
   end
end

