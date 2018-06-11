class Subject < ApplicationRecord
  belongs_to :tag
  belongs_to :milestone
end
