require 'rails_helper'

#Test 1 
# Should pass with a user creating a vaild account using a valid username, email and password.
user1 = User.create(username: "tom", email: "tom@test.com",  password: "tom123")
find_user_1 = User.find_by(username: "#{user1.username}") 

#Test 2 
# Should pass with a user creating a vaild account using a valid username, email and password.
user2 = User.create(username: "kate", email: "kate@test.com",  password: "kate123")
find_user_2  = User.find_by(username: "#{user2.username}") 

#Test 3 
# Should pass with a user creating a vaild account using a valid username, email and password.
user3 = User.create(username: "ben", email: "ben@test.com",  password: "ben123")
find_user_3 = User.find_by(username: "#{user3.username}") 

#Test 4
# Should pass with a user failing to create an account using a valid username, password. and missing email attribute.
user4 = User.create(username: "kane", password: "kane123")

#Test 5
# Should pass with a user failing to create an account using a valid username, email and  missing password attribute.
user5 = User.create(username: "kane", email: "kane@test.com")

#Test 6
# Should pass with a user failing to create an account using a valid email, password and  missing username attribute.
user6 = User.create(email: "kane@test.com", password: "kane123")

#Test 7
# Should pass with a user failing to create an account using a email, password and username attribute.
user7 = User.create(username: "tom", email: "tom@test.com",  password: "tom123")

#Test 8
# Should pass when a user deletes their account.
user8 = User.create(username: "fin", email: "fin@test.com",  password: "fin123")
find_user_8 = User.find_by(username: "fin")

RSpec.describe User, type: :model do

  it"is a valid account with complete valid attributes" do

    expect(find_user_1).to be_valid
    expect(find_user_2).to be_valid
    expect(find_user_3).to be_valid
  end

  it"is not a valid account with incomplete or missing valid attributes" do
    expect(user4).not_to be_valid
    expect(user5).not_to be_valid
    expect(user6).not_to be_valid
  end

  it"is not a valid account when inputed attributes have already been taken by other users." do
    expect(user7).not_to be_valid
  end

  it"account can be deleted" do
    find_user_8.destroy
    expect(User.find_by(username: "fin")).to be(nil)
  end
end


