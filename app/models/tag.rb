class Tag < ApplicationRecord
  # belongs_to :user
  has_many :subjects, inverse_of: :tag
  has_many :milestones , through: :subjects
  validates :title, presence: true, uniqueness: true
end
