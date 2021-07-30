class User < ApplicationRecord
    has_secure_password
    validates :username,presence: true, uniqueness: true, length: { maximum: 15, too_long: "- %{count} characters is the maximum allowed."}
    validates :email, presence: true, uniqueness: true
end
