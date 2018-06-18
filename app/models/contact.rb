class Contact < ApplicationRecord
  include PgSearch

  pg_search_scope :search_by_first_name_and_last_name,
    against: [:first_name, :last_name],
    using: {
      tsearch:  { prefix: true }
    }

  belongs_to :user
  has_many :milestones
  has_many :locations , through: :milestones
  has_many :tags , through: :milestones


  accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :milestones, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  # validates :first_name, presence: true
  validates :username, uniqueness: true, allow_blank: true

  validates :email, uniqueness: true, allow_blank: true, presence: true

  # mount_uploader :photo, PhotoUploader
   # include PgSearch
   #  pg_search_scope :search_by_date_and_price,
   #  against: [ :date, :price ],
   #  using: {
   #    tsearch: { prefix: true }
   #   }
  # after_save :async_update # Run on create & update

  # private

  # def async_update
  #   UpdateContactJob.perform_later(self.email) if self.email
  # end
end



