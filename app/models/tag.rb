class Tag < ApplicationRecord
  has_many :subjects, inverse_of: :tag
  has_many :milestones , through: :subjects
  belongs_to :user

  validates :title, presence: true, uniqueness: true
end
