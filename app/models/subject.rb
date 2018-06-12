class Subject < ApplicationRecord
  belongs_to :tag
  belongs_to :milestone

  accepts_nested_attributes_for :tag, reject_if: :all_blank, allow_destroy: true
end
