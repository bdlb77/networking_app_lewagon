class Milestone < ApplicationRecord
  belongs_to :contact
  has_many :subjects
  has_many :tags
  has_many :locations
  validates :contact_type, presence: true
end



