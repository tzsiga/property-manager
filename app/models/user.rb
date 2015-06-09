class User < ActiveRecord::Base
  has_many :reservations
  validates :email, presence: true, length: { minimum: 6 }
end
