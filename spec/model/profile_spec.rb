require 'rails_helper'

#Test 1 
# Should pass with a valid user creating a profile with a valid first_name, last_name and avatar.
user1 = User.create(username: "tom", email: "tom@test.com",  password: "tom123")
find_user_1 = User.find_by(username: "#{user1.username}") 

tom_profile = Profile.new(
    first_name: "Tom",
    last_name: "Jerry",
    user_id: find_user_1.id)

tom_profile.avatar.attach(io: File.open('app/assets/images/Placeholder.jpg'), filename: 'Placeholder.jpg', content_type: 'image/jpg')
tom_profile.save

#Test 2
# Should pass with a valid user failing to crete a profile with a valid first_name, missing last_name and avatar.
user2 = User.create(username: "kane", email: "kane@test.com",  password: "kane123")
find_user_2 = User.find_by(username: "#{user2.username}") 

kane_profile = Profile.new(
    first_name: "Kane",
    user_id: find_user_2.id)

kane_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_ray.jpg'), filename: 'test_avatar_ray.jpg', content_type: 'image/jpg')
kane_profile.save

#Test 3
# Should pass with a valid user failing to crete a profile with a missing first_name, valid last_name and avatar.
user3 = User.create(username: "kate", email: "kate@test.com",  password: "kate123")
find_user_3 = User.find_by(username: "#{user3.username}") 
kate_profile = Profile.new(
    last_name: "Summers",
    user_id: find_user_3.id)

kate_profile.avatar.attach(io: File.open('app/assets/images/test_avatar_summer.jpg'), filename: 'test_avatar_summer.jpg', content_type: 'image/jpg')
kate_profile.save

#Test 4
# Should pass with a valid user failing to crete a profile with a valid first_name, last_name and missing avatar.
user4 = User.create(username: "bob", email: "bob@test.com",  password: "bob123")
find_user_4 = User.find_by(username: "#{user4.username}") 

bob_profile = Profile.new(
    first_name: "Bob",
    last_name: "Love",
    user_id: find_user_4.id)

bob_profile.save

#Test 5
# Should pass when a valid user creates a profile with a invalid first_name of over 30 characters.
user5 = User.create(username: "sam", email: "same@test.com",  password: "sam123")
find_user_5 = User.find_by(username: "#{user5.username}") 

sam_profile = Profile.new(
    first_name: "Same16465547347465756483647364744656565756575657535425824764744484#1990",
    last_name: "Jerry",
    user_id: find_user_5.id)

sam_profile.avatar.attach(io: File.open('app/assets/images/Placeholder.jpg'), filename: 'Placeholder.jpg', content_type: 'image/jpg')
sam_profile.save

#Test 6 
# Should pass when a valid user creates a profile with a invalid  last_nameof over 30 characters.
user6 = User.create(username: "kim", email: "kim@test.com",  password: "kim123")
find_user_6 = User.find_by(username: "#{user6.username}") 

kim_profile = Profile.new(
    first_name: "Kim",
    last_name: "Jerry16465547347465756483647364744656565756575657535425824764744484#1990",
    user_id: find_user_6.id)

kim_profile.avatar.attach(io: File.open('app/assets/images/Placeholder.jpg'), filename: 'Placeholder.jpg', content_type: 'image/jpg')
kim_profile.save

#Test 7
# Should pass with a valid user updates the profile.
user7 = User.create(username: "james", email: "james@test.com",  password: "james123")
find_user_7 = User.find_by(username: "#{user7.username}") 

james_profile = Profile.new(
    first_name: "James",
    last_name: "tee",
    user_id: find_user_7.id)

james_profile.avatar.attach(io: File.open('app/assets/images/Placeholder.jpg'), filename: 'Placeholder.jpg', content_type: 'image/jpg')
james_profile.save

find_james_profile = Profile.find_by(first_name: "James")



RSpec.describe Profile, type: :model do
  it"is valid with complete valid attributes" do
    expect(tom_profile).to be_valid
  end
  
  it"is not valid with incomplete or missing attributes" do
    expect(kane_profile).not_to be_valid
    expect(kate_profile).not_to be_valid
    expect(bob_profile).not_to be_valid
  end

  it"is not valid when first_name has more then 30 characters" do
    expect(sam_profile).not_to be_valid
  end

  it"is not valid when last_name has more then 30 characters" do
    expect(kim_profile).not_to be_valid
  end

  it 'checks that a profile can be updated' do
    find_james_profile.update(first_name: "NoobMaster")
    expect(Profile.find_by(first_name: "NoobMaster")).to eq(find_james_profile)
    end
end


