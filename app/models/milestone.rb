class Milestone < ApplicationRecord
  belongs_to :contact
  belongs_to :location
  has_many :subjects, dependent: :destroy
  has_many :tags , through: :subjects
  has_many :assigments

  accepts_nested_attributes_for :subjects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :contact, reject_if: :all_blank
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true
end



