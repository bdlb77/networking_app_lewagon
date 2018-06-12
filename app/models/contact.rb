class Contact < ApplicationRecord
  include PgSearch  
  pg_search_scope :search_by_first_name_and_last_name,
    against: [:first_name, :last_name],
    using: {
      tsearch:  { prefix: true }
    }
  
  belongs_to :user
  has_many :milestones
  validates :first_name, presence: true
  validates :username, uniqueness: true, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true
  # mount_uploader :photo, PhotoUploader
   # include PgSearch
   #  pg_search_scope :search_by_date_and_price,
   #  against: [ :date, :price ],
   #  using: {
   #    tsearch: { prefix: true }
   #   }
end



