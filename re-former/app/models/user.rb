class User < ActiveRecord::Base
  # Before saving to database, lowercase the email
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {maximum: 20}
  # Regular expression for a valid email address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false},
                    allow_nil: true
  # For use with bcrypt
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}  
end
