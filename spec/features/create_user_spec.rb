require 'rails_helper'

describe 'Users' do
  it 'can be created from the users page' do
    visit('/users')

    user = build(:user)

    expect(page).to have_css '.btn-info', 'New User'
  end
end
