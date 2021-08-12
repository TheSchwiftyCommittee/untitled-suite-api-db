class Profile < ApplicationRecord
    belongs_to :user, optional: false
    #A profile has one avatar atatched to it
    has_one_attached :avatar

    validates :first_name, presence: true, length: { maximum: 30, too_long: "- %{count} characters is the maximum allowed."}
    validates :last_name, presence: true, length: { maximum: 30, too_long: "- %{count} characters is the maximum allowed."}
    validates :avatar, presence: true
end
