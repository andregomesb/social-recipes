 require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid' do
    user = User.create()
    expect(user).not_to be_valid
    expect(user.errors[:name]).to         include(I18n.t 'errors.messages.blank')
    expect(user.errors[:email]).to      include(I18n.t 'errors.messages.blank')
    expect(user.errors[:email]).to      include(I18n.t 'errors.messages.invalid')
    expect(user.errors[:password]).to         include(I18n.t 'errors.messages.blank')
    expect(user.errors[:password]).to         include(I18n.t 'errors.messages.too_short', count:6)
  end
end
