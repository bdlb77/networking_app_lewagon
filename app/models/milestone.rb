class Milestone < ApplicationRecord
  belongs_to :contact
  has_many :subjects
  belongs_to :location
  has_many :tags , through: :subjects

  accepts_nested_attributes_for :subjects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :contact, reject_if: :all_blank
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  validates :contact_type, presence: true
end



