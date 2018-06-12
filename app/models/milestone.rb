class Milestone < ApplicationRecord
  belongs_to :contact
  belongs_to :location
  has_many :subjects
  validates :contact_type, presence: true
end



