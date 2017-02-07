require 'rails_helper'
RSpec.describe Recipe, type: :model do
  it 'should be valid' do
    blank_message = I18n.t('errors.messages.blank')
    required_message = I18n.t('errors.messages.required')
    recipe = Recipe.create
    expect(recipe).not_to be_valid
    expect(recipe.errors[:name]).to include(blank_message)
    expect(recipe.errors[:meal]).to include(required_message)
    expect(recipe.errors[:cuisine]).to include(required_message)
    expect(recipe.errors[:ingredients]).to include(blank_message)
    expect(recipe.errors[:instructions]).to include(blank_message)
  end
end
