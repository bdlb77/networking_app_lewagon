class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :contacts
  has_many :locations, through: :contacts
  has_many :tags, through: :contacts

  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true
end
