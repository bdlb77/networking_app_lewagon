class Location < ApplicationRecord

  belongs_to :user
  has_many :milestones
  validates :title, presence: true, uniqueness: true
end
