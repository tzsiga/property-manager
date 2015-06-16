require 'rails_helper'

describe 'Users' do
  it 'can be created from the users page' do
    visit('/users')

    user = build(:user)

    expect(user.first_name).to eq 'Factory'
    expect(user.last_name).to eq 'User'
    expect(user.email).to eq 'user@factory.com'

    expect(page).to have_css '.btn-info', 'New User'
  end
end
