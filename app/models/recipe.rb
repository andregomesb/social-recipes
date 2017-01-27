class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :meal
  enum difficulty: [:easy, :medium, :hard]

  validates :name, :ingredients, :instructions, presence: true

  def self.difficulty_select
    Recipe.difficulties.keys.map do |k|
      [I18n.t(k,scope:[:activerecord, :attributes, :recipe, :difficulties]).humanize, k]
    end
  end
end
