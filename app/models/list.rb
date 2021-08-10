class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  #Following fields have length restrictions
  validates :title, length: { maximum: 30, too_long: "- %{count} characters is the maximum allowed. "}
end

