class Tag < ApplicationRecord
  has_many :subjects
  belongs_to :user
  validates :title, presence: true, uniqueness: true
end
