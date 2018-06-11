class Tag < ApplicationRecord

  belongs_to :user
  belongs_to :milestone
  validates :title, presence: true, uniqueness: true
end
