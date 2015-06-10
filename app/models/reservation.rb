class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  validates :from, presence: true
  validates :to, presence: true
end
