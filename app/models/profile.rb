class Profile < ApplicationRecord
    belongs_to :user, optional: false
    #A profile has one avatar atatched to it
    has_one_attached :avatar
end
