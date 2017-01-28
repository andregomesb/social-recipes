require 'rails_helper'
RSpec.describe Recipe, type: :model do
    it 'should be valid' do
      recipe = Recipe.create()
      expect(recipe).not_to be_valid
      expect(recipe.errors[:name]).to         include(I18n.t 'errors.messages.blank')
      expect(recipe.errors[:cuisine]).to      include(I18n.t 'errors.messages.required')
      expect(recipe.errors[:meal]).to         include(I18n.t 'errors.messages.required')
      expect(recipe.errors[:ingredients]).to  include(I18n.t 'errors.messages.blank')
      expect(recipe.errors[:instructions]).to include(I18n.t 'errors.messages.blank')
    end
end
