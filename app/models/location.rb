class Location < ApplicationRecord
  # belongs_to :user
  has_many :milestone
  validates :title, presence: true, uniqueness: true
end
