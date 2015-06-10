class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  before_save {
    if self.email != nil
      self.email = email.downcase
    end
  }
  validates :username, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false},
                    allow_nil: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
