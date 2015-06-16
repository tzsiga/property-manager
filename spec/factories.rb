require 'rails_helper'

FactoryGirl.define do
  factory :user do
    first_name 'Factory'
    last_name  'User'
    email 'user@factory.com'
  end
end
