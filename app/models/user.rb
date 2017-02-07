class User < ApplicationRecord
  has_many :recipes
  has_many :favorite_recipes
  has_many :favorites, through: :favorite_recipes, source: :recipe

  has_secure_password

  validates :name, :city, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true,
                       length: { minimum: 6 },
                       allow_nil: true,
                       confirmation: true

  before_save :email_formatting

  private

  def email_formatting
    self.email = email.downcase
  end
end
