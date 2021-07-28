class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :username, length: { maximum: 15, too_long: "-%{count} characters is the maximum allowed."}
         validates :password, length: { maximum: 15, too_long: "-%{count} characters is the maximum allowed."}
end
