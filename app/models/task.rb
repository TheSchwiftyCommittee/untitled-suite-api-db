class Task < ApplicationRecord
  belongs_to :list

  priority = ["Critical", "High", "Medium", "Low"]

  validates :title, :description, :priority, presence: true
  #Following fields have length restrictions
  validates :title, length: { maximum: 30, too_long: "- %{count} characters is the maximum allowed. "}
  validates :description, length: { maximum: 2000, too_long: "- %{count} characters is the maximum allowed. "}
end
