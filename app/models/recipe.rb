class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :cuisine
  belongs_to :meal

  has_many :favorite_recipes
  has_many :favorited_by, through: :favorite_recipes, source: :user

  enum difficulty: [:easy, :medium, :hard]
  validates :name, :ingredients, :instructions, presence: true

  has_attached_file :recipe_image, styles: {large: "600x600", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :recipe_image, content_type: /\Aimage\/.*\z/

  def self.difficulty_select
    Recipe.difficulties.keys.map do |k|
      [I18n.t(k,scope:[:activerecord, :attributes, :recipe, :difficulties]).humanize, k]
    end
  end

  def self.search(recipe)
    where("name like ?", "%#{recipe}%")
  end
end
