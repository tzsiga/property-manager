class Property < ActiveRecord::Base
  has_many :reservations
  validates :name, length: { minimum: 3 }
  validates :rooms, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :facilities, presence: true
  validates :category, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :address, presence: true
end
