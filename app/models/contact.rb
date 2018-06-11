class Contact < ApplicationRecord
  belongs_to :user
  has_many :milestones
  has_many :locations , through: :milestones

  accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :milestones, reject_if: :all_blank, allow_destroy: true

  validates :first_name, presence: true
  validates :username, uniqueness: true, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true
  # has_one :photo
  # mount_uploader :photo, PhotoUploader
   # include PgSearch
   #  pg_search_scope :search_by_date_and_price,
   #  against: [ :date, :price ],
   #  using: {
   #    tsearch: { prefix: true }
   #   }
end



