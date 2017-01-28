class User < ApplicationRecord

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: {case_sensitive: false},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, length: { minimum: 6 }
  has_secure_password

  before_save :email_formatting

  private
  def email_formatting
    self.email = email.downcase
  end
end
