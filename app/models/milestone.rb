class Milestone < ApplicationRecord
  belongs_to :contact
  has_many :tags
  has_many :locations
end
