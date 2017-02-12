class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :cuisine
  belongs_to :meal

  has_many :favorite_recipes
  has_many :favorited_by, through: :favorite_recipes, source: :user

  enum difficulty: [:easy, :medium, :hard]
  validates :name, :ingredients, :instructions, :cuisine_id, :meal_id, :portion,
            :preparation_time, :difficulty, presence: true

  has_attached_file :recipe_image,
                    styles: { large: '600x600#', medium: '400x400#',
                              thumb: '100x100#' },
                    default_url: '/images/missing.jpg'
  validates_attachment_content_type :recipe_image,
                                    content_type:
                                    ['image/jpg', 'image/png', 'image/jpeg']

  MOST_FAVORITES = 8
  scope :latest_recipes, ->(limit) { order(created_at: :desc).limit(limit) }
  scope :most_favorited, lambda {
    joins(:favorite_recipes)
      .select('recipes.*, COUNT(recipe_id) as recipe_count')
      .group('recipes.id')
      .order('recipe_count DESC')
      .limit(MOST_FAVORITES)
  }

  def self.difficulty_select
    Recipe.difficulties.keys.map do |k|
      [I18n.t(k, scope: [:activerecord, :attributes, :recipe, :difficulties])
           .humanize, k]
    end
  end

  def self.search(recipe)
    where('name like ?', "%#{recipe}%")
  end

  def ingredients_items
    ingredients.split("\r\n").map { |item| item.split(',') }
  end
end
