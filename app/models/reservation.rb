class Reservation < ActiveRecord::Base
  #belongs_to :property, :user
  validates :from, presence: true
  validates :to, presence: true
end
