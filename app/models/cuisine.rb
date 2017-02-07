class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
