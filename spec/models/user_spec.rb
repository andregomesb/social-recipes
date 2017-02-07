require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid' do
    blank_message = I18n.t('errors.messages.blank')
    invalid_message = I18n.t('errors.messages.invalid')
    user = User.create
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include(blank_message)
    expect(user.errors[:email]).to include(blank_message)
    expect(user.errors[:email]).to include(invalid_message)
    expect(user.errors[:password]).to include(blank_message)
  end

  it 'password should have minimum' do
    too_short_message = I18n.t('errors.messages.too_short', count: 6)
    user = User.create(password: 'abcd')
    expect(user).not_to be_valid
    expect(user.errors[:password]).to include(too_short_message)
  end
end
