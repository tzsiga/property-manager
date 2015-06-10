class Property < ActiveRecord::Base
  has_many :reservations
  validates :name, presence: true
  validates :rooms, presence: true
  validates :facilities, presence: true
  validates :category, presence: true
  validates :rating, presence: true
  validates :address, presence: true
end